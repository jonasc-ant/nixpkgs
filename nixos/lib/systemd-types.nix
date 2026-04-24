{
  lib,
  systemdUtils,
  pkgs,
}:

let
  inherit (systemdUtils.lib)
    automountConfig
    makeUnit
    unitNameType
    mountConfig
    pathConfig
    sliceConfig
    socketConfig
    stage1ServiceConfig
    stage2ServiceConfig
    targetConfig
    timerConfig
    unitConfig
    ;

  inherit (systemdUtils.unitOptions)
    automountOptions
    commonUnitOptions
    mountOptions
    pathOptions
    serviceOnlyOptions
    serviceOptions
    sliceOptions
    socketOptions
    stage2CommonUnitOptions
    stage2ServiceOptions
    timerOptions
    ;

  inherit (lib)
    mkDefault
    mkDerivedConfig
    mkEnableOption
    mkIf
    mkOption
    ;

  inherit (lib.types)
    attrsOf
    coercedTo
    enum
    lines
    listOf
    nullOr
    oneOf
    package
    path
    record
    singleLineStr
    submodule
    ;

  # ── typed-unit records ──────────────────────────────────────────────
  # Each `systemd.{services,sockets,…}.<name>` element used to be a
  # `submodule [ optionsModule unitConfig typeConfig ]`, paying a full
  # `evalModules` fixpoint per element. The composition is fixed and
  # the option set is static, so we flatten it into a `record`:
  #   • `fields`  — the union of the composed modules' `options` sets
  #                 (plain `mkOption` results are valid record fields).
  #   • `finalise` — a list of adapters that call the existing
  #                 `*Config` modules with `config = self` /
  #                 `options = fields`, so the cross-field defaults are
  #                 byte-identical to the submodule formulation.
  #
  # `record` runs `pushDownProperties` over each finalise result, so the
  # adapters may return `mkMerge`/`mkIf` at their top level (as
  # `serviceOptions` does for the script→Exec* mapping).

  declarations = [ ./systemd-unit-options.nix ];

  # Field sets (static option attrsets, no per-element closure).
  stage1Base = commonUnitOptions.options;
  stage2Base = stage1Base // stage2CommonUnitOptions.options;

  # Adapter: call a `{ name, config, options, lib, ... }: { config = …; }`
  # module with the record-finalise arguments. `fields` (the per-field
  # `mergeDefinitions` results) stand in for `options` — they expose
  # `.isDefined`, which is the only `options.*` property the adapters read.
  call =
    f:
    { name, self, fields, ... }:
    (f {
      inherit name lib;
      config = self;
      options = fields;
    }).config;

  unitFin = call unitConfig;

  mkTypedUnit =
    container: extraFields: extraFinalise:
    {
      stage1 = container (record {
        inherit declarations;
        fields = stage1Base // extraFields;
        finalise = [ unitFin ] ++ extraFinalise;
      });
      stage2 = container (record {
        inherit declarations;
        fields = stage2Base // extraFields;
        finalise = [ unitFin ] ++ extraFinalise;
      });
    };

  target = mkTypedUnit attrsOf { } [ (call targetConfig) ];
  socket = mkTypedUnit attrsOf socketOptions.options [ (call socketConfig) ];
  timer = mkTypedUnit attrsOf timerOptions.options [ (call timerConfig) ];
  path' = mkTypedUnit attrsOf pathOptions.options [ (call pathConfig) ];
  slice = mkTypedUnit attrsOf sliceOptions.options [ (call sliceConfig) ];
  mount = mkTypedUnit listOf mountOptions.options [ (call mountConfig) ];
  automount = mkTypedUnit listOf automountOptions.options [ (call automountConfig) ];

  service = {
    stage1 = attrsOf (record {
      inherit declarations;
      fields = stage1Base // serviceOnlyOptions;
      finalise = [
        unitFin
        (call serviceOptions)
        (call stage1ServiceConfig)
      ];
    });
    stage2 = attrsOf (record {
      inherit declarations;
      fields = stage2Base // serviceOnlyOptions // stage2ServiceOptions.options;
      finalise = [
        unitFin
        (call serviceOptions)
        # `stage2ServiceConfig` is `{ imports = [serviceConfig]; config.path = … }`.
        # `call` only reads `.config`, so we apply the import explicitly.
        (call stage1ServiceConfig)
        (call stage2ServiceConfig)
      ];
    });
  };

  initrdStorePathModule =
    { config, ... }:
    {
      options = {
        enable = (mkEnableOption "copying of this file and symlinking it") // {
          default = true;
        };

        target = mkOption {
          type = nullOr path;
          description = ''
            Path of the symlink.
          '';
          default = null;
        };

        source = mkOption {
          type = path;
          description = "Path of the source file.";
        };

        dlopen = {
          usePriority = mkOption {
            type = enum [
              "required"
              "recommended"
              "suggested"
            ];
            default = "recommended";
            description = ''
              Priority of dlopen ELF notes to include. "required" is
              minimal, "recommended" includes "required", and
              "suggested" includes "recommended".

              See: <https://systemd.io/ELF_DLOPEN_METADATA/>
            '';
          };

          features = mkOption {
            type = listOf singleLineStr;
            default = [ ];
            description = ''
              Features to enable via dlopen ELF notes. These will be in
              addition to anything included via 'usePriority',
              regardless of their priority.
            '';
          };
        };
      };
    };

in

{
  units = attrsOf (
    lib.types.record {
      declarations = [ ./systemd-unit-options.nix ];
      description = "systemd unit";
      fields = {

        enable = {
          type = lib.types.bool;
          default = true;
          description = ''
            If set to false, this unit will be a symlink to
            /dev/null. This is primarily useful to prevent specific
            template instances
            (e.g. `serial-getty@ttyS0`) from being
            started. Note that `enable=true` does not
            make a unit start by default at boot; if you want that, see
            `wantedBy`.
          '';
        };

        name = {
          type = lib.types.str;
          description = ''
            The name of this systemd unit, including its extension.
            This can be used to refer to this unit from other systemd units.
          '';
        };

        overrideStrategy = {
          type = lib.types.enum [
            "asDropinIfExists"
            "asDropin"
          ];
          default = "asDropinIfExists";
          description = ''
            Defines how unit configuration is provided for systemd:

            `asDropinIfExists` creates a unit file when no unit file is provided by the package
            otherwise it creates a drop-in file named `overrides.conf`.

            `asDropin` creates a drop-in file named `overrides.conf`.
            Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

            See also {manpage}`systemd.unit(5)`.
          '';
        };

        requiredBy = {
          type = lib.types.listOf unitNameType;
          default = [ ];
          description = ''
            Units that require (i.e. depend on and need to go down with) this unit.
            As discussed in the `wantedBy` option description this also creates
            `.requires` symlinks automatically.
          '';
        };

        upheldBy = {
          type = lib.types.listOf unitNameType;
          default = [ ];
          description = ''
            Keep this unit running as long as the listed units are running. This is a continuously
            enforced version of wantedBy.
          '';
        };

        wantedBy = {
          type = lib.types.listOf unitNameType;
          default = [ ];
          description = ''
            Units that want (i.e. depend on) this unit. The default method for
            starting a unit by default at boot time is to set this option to
            `["multi-user.target"]` for system services. Likewise for user units
            (`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
            start by default when the user `<name>` logs on.

            This option creates a `.wants` symlink in the given target that exists
            statelessly without the need for running `systemctl enable`.
            The `[Install]` section described in {manpage}`systemd.unit(5)` however is
            not supported because it is a stateful process that does not fit well
            into the NixOS design.
          '';
        };

        aliases = {
          type = lib.types.listOf unitNameType;
          default = [ ];
          description = "Aliases of that unit.";
        };

        text = {
          type = lib.types.nullOr lib.types.str;
          default = null;
          description = "Text of this systemd unit.";
        };

        unit = {
          type = lib.types.unspecified;
          internal = true;
          description = "The generated unit.";
        };

      };

      finalise =
        { name, self, ... }:
        {
          name = mkDefault name;
          unit = mkDefault (makeUnit name self);
        };
    }
  );

  services = service.stage2;
  initrdServices = service.stage1;

  targets = target.stage2;
  initrdTargets = target.stage1;

  sockets = socket.stage2;
  initrdSockets = socket.stage1;

  timers = timer.stage2;
  initrdTimers = timer.stage1;

  paths = path'.stage2;
  initrdPaths = path'.stage1;

  slices = slice.stage2;
  initrdSlices = slice.stage1;

  mounts = mount.stage2;
  initrdMounts = mount.stage1;

  automounts = automount.stage2;
  # NB: stage1 automounts is `attrsOf`, not `listOf` — see initrd.nix.
  initrdAutomounts = attrsOf (record {
    inherit declarations;
    fields = stage1Base // automountOptions.options;
    finalise = [ unitFin (call automountConfig) ];
  });

  initrdStorePath = listOf (
    coercedTo (oneOf [
      singleLineStr
      package
    ]) (source: { inherit source; }) (submodule initrdStorePathModule)
  );

  initrdContents = attrsOf (
    submodule (
      {
        config,
        options,
        name,
        ...
      }:
      {
        imports = [ initrdStorePathModule ];
        options = {
          text = mkOption {
            default = null;
            type = nullOr lines;
            description = "Text of the file.";
          };
        };

        config = {
          target = mkDefault name;
          source = mkIf (config.text != null) (
            let
              name' = "initrd-" + baseNameOf name;
            in
            mkDerivedConfig options.text (pkgs.writeText name')
          );
        };
      }
    )
  );
}

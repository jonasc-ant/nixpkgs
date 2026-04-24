{
  config,
  lib,
  pkgs,
  options,
  ...
}:

let
  cfg = config.services.prometheus.exporters.json;
  inherit (lib)
    mkOption
    types
    escapeShellArg
    concatStringsSep
    mkRemovedOptionModule
    ;
in
{
  port = 7979;
  extraOpts = {
    configFile = mkOption {
      type = types.path;
      description = ''
        Path to configuration file.
      '';
    };
  };
  serviceOpts = {
    serviceConfig = {
      ExecStart = ''
        ${pkgs.prometheus-json-exporter}/bin/json_exporter \
          --config.file ${escapeShellArg cfg.configFile} \
          --web.listen-address="${cfg.listenAddress}:${toString cfg.port}" \
          ${concatStringsSep " \\\n  " cfg.extraFlags}
      '';
    };
  };
}

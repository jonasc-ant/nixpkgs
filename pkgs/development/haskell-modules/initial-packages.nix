args@{
  pkgs,
  lib,
  callPackage,
}:
self:
# Lazy shard dispatcher for the hackage package set.
#
# The auto-generated hackage-packages.nix is a single ~775 K-line
# expression; touching any haskellPackages.* attribute forces the parser
# across the whole file even though a typical closure needs ~1 % of the
# entries.  split-hackage-packages.sh post-processes that file into
# per-prefix shards (./hackage-packages/<pfx>.nix, 4-char lower prefix
# by default) plus a static name → shard map (./hackage-names.nix), and
# this expression routes each
# name through builtins.mapAttrs so:
#
#   * builtins.attrNames is available immediately (mapAttrs preserves
#     keys; the names map is a literal attrset);
#   * a shard file is imported — and therefore parsed — only when one of
#     its packages is actually forced.
#
# Each shard has the same `{ pkgs, lib, callPackage }: self: { … }` shape
# as the monolith so the callPackage bodies are byte-identical.
let
  shards = builtins.mapAttrs (
    f: _: import (./hackage-packages + "/${f}") args self
  ) (builtins.readDir ./hackage-packages);
in
builtins.mapAttrs (n: f: shards.${f}.${n}) (import ./hackage-names.nix)

#!/usr/bin/env bash
# Benchmark harness for nixpkgs perf improvements.
# Measures eval stats via NIX_SHOW_STATS and wall-clock via hyperfine.
#
# Usage:
#   bench/harness.sh <workload> [label]
#
# Workloads:
#   hello       - evaluate pkgs.hello.drvPath (small, fast)
#   attrnames   - count top-level pkgs attrs (medium, exercises callPackage)
#   lib         - run lib tests (exercises lib/strings.nix heavily)
#   nixos       - evaluate a minimal NixOS config (exercises module system)
#   strings     - stress lib.strings functions directly
#
# Output: JSON stats + hyperfine timing, written to bench/results/<label>-<workload>.json

set -euo pipefail

cd "$(dirname "$0")/.."
WORKLOAD="${1:-hello}"
LABEL="${2:-$(git rev-parse --short HEAD)}"
OUTDIR="bench/results"
mkdir -p "$OUTDIR"

case "$WORKLOAD" in
  hello)
    EXPR='(import ./. {}).hello.drvPath'
    ;;
  attrnames)
    EXPR='builtins.length (builtins.attrNames (import ./. {}))'
    ;;
  lib)
    EXPR='let r = import ./lib/tests/misc.nix; in builtins.deepSeq r (builtins.length r)'
    ;;
  nixos)
    EXPR='(import ./nixos/lib/eval-config.nix { modules = [ ({...}: { boot.isContainer = true; system.stateVersion = "25.05"; }) ]; system = "x86_64-linux"; }).config.system.build.toplevel.drvPath'
    ;;
  strings)
    EXPR='let lib = import ./lib; xs = lib.genList (i: "foo-bar-baz-${toString i}.1.2.3-rc4") 10000; ys = map (s: lib.strings.sanitizeDerivationName (lib.strings.toCamelCase s)) xs; in builtins.deepSeq ys (builtins.length ys)'
    ;;
  *)
    echo "unknown workload: $WORKLOAD" >&2
    exit 1
    ;;
esac

STATS="$OUTDIR/$LABEL-$WORKLOAD.stats.json"
TIMING="$OUTDIR/$LABEL-$WORKLOAD.timing.json"

echo "=== $LABEL / $WORKLOAD ==="

# One run for stats
NIX_SHOW_STATS=1 NIX_SHOW_STATS_PATH="$STATS" \
  nix-instantiate --eval --readonly-mode -E "$EXPR" >/dev/null 2>&1 || {
    echo "eval failed; retrying with stderr:" >&2
    nix-instantiate --eval --readonly-mode -E "$EXPR"
    exit 1
  }

python3 - "$STATS" <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
print(f"  cpuTime:     {d['cpuTime']:.4f}s")
print(f"  primops:     {d['nrPrimOpCalls']:,}")
print(f"  lookups:     {d['nrLookups']:,}")
print(f"  thunks:      {d['nrThunks']:,}")
print(f"  funcCalls:   {d['nrFunctionCalls']:,}")
if 'gc' in d:
    print(f"  heapSize:    {d['gc'].get('heapSize', 0):,}")
PY

# Hyperfine for wall-clock stability (warmup + 5 runs)
hyperfine --warmup 2 --runs 5 --export-json "$TIMING" \
  "nix-instantiate --eval --readonly-mode -E '$EXPR' >/dev/null 2>&1" 2>/dev/null

python3 - "$TIMING" <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
r = d['results'][0]
print(f"  wall mean:   {r['mean']*1000:.1f}ms ± {r['stddev']*1000:.1f}ms")
PY

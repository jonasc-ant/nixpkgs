#!/usr/bin/env bash
# Compare two benchmark labels side-by-side.
# Usage: bench/compare.sh <baseline-label> <candidate-label> <workload>

set -euo pipefail
cd "$(dirname "$0")/.."

A="$1"; B="$2"; W="$3"
SA="bench/results/$A-$W.stats.json"
SB="bench/results/$B-$W.stats.json"
TA="bench/results/$A-$W.timing.json"
TB="bench/results/$B-$W.timing.json"

python3 - "$SA" "$SB" "$TA" "$TB" "$A" "$B" <<'PY'
import json, sys
sa = json.load(open(sys.argv[1]))
sb = json.load(open(sys.argv[2]))
ta = json.load(open(sys.argv[3]))['results'][0]
tb = json.load(open(sys.argv[4]))['results'][0]
la, lb = sys.argv[5], sys.argv[6]

def row(name, a, b, fmt="{:,}"):
    delta = (b - a) / a * 100 if a else 0
    sign = "+" if delta >= 0 else ""
    print(f"  {name:12} {fmt.format(a):>15} {fmt.format(b):>15}  {sign}{delta:.2f}%")

print(f"{'metric':14} {la:>15} {lb:>15}  delta")
row("cpuTime",   sa['cpuTime'],       sb['cpuTime'],       "{:.4f}")
row("primops",   sa['nrPrimOpCalls'], sb['nrPrimOpCalls'])
row("lookups",   sa['nrLookups'],     sb['nrLookups'])
row("thunks",    sa['nrThunks'],      sb['nrThunks'])
row("funcCalls", sa['nrFunctionCalls'], sb['nrFunctionCalls'])
row("wall(ms)",  ta['mean']*1000,     tb['mean']*1000,     "{:.1f}")
PY

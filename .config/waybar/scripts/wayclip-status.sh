#!/usr/bin/env bash

PROCESS="cli"
pid=$(pgrep -x "$PROCESS" | head -n1)

if [ -n "$pid" ]; then
    read cpu ram_kb <<<$(top -b -n 1 -p "$pid" | awk -v pid="$pid" '$1 == pid {print $9, $6}')

    ram_mb=$((${ram_kb//[^0-9]/} / 1024))

    gpu_mem=$(nvidia-smi --query-compute-apps=pid,used_gpu_memory --format=csv,noheader,nounits 2>/dev/null |
        awk -F',' -v pid="$pid" '$1 == pid {gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2); print $2}')
    gpu_mem=${gpu_mem:-0}

    gpu_util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -n 1)
    gpu_util=${gpu_util:-0}

    printf "[wayclip CPU:%s%% RAM:%dM GPU:%s%% VRAM:%sM]\n" "$cpu" "$ram_mb" "$gpu_util" "$gpu_mem"
fi

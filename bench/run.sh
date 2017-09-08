#!/bin/bash

function run {
	local filter="$1"
    local threads="$2"
    local iters="$3"

    ./build/bench-tests $threads $iters --benchmark_filter=$filter
}

run "$1" "$threads" "$work"
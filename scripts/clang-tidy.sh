#!/usr/bin/env bash

set -eu
set -o pipefail

# https://clang.llvm.org/extra/clang-tidy/

# to speed up re-runs, only re-create environment if needed
if [[ ! -f local.env ]]; then
    # automatically setup environment
    ./scripts/setup.sh --config local.env
fi

# source the environment
source local.env

PATH_TO_CLANG_TIDY_SCRIPT="$(pwd)/mason_packages/.link/share/run-clang-tidy.py"

# to speed up re-runs, only install clang-tidy if needed
if [[ ! -f PATH_TO_CLANG_TIDY_SCRIPT ]]; then
    # The MASON_LLVM_RELEASE variable comes from `local.env`
    mason install clang-tidy ${MASON_LLVM_RELEASE}
    # We link the tools to make it easy to know ${PATH_TO_CLANG_TIDY_SCRIPT}
    mason link clang-tidy ${MASON_LLVM_RELEASE}
fi

make clean
RESULT=0
make 2>&1 | tee /tmp/build-output.txt || RESULT=$?
if [[ ${RESULT} != 0 ]]; then
    echo "Build failed, could not generate compile commands for clang-tidy, aborting!"
    exit ${RESULT}
else
    cat /tmp/build-output.txt | scripts/generate_compile_commands.py > compile_commands.json
fi

# change into the build directory so that clang-tidy can find the files
# at the right paths (since this is where the actual build happens)
${PATH_TO_CLANG_TIDY_SCRIPT} -fix

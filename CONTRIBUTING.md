# Code Formatting

We use [this script](/scripts/setup.sh#L7%60) to install a consistent version of [`clang-format`](https://clang.llvm.org/docs/ClangFormat.html) to format the code base. The format is automatically checked via a Travis CI build as well. Run the following script locally to ensure formatting is ready to merge:

    make format
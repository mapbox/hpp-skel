# Developer

We use [`clang-format`](https://clang.llvm.org/docs/ClangFormat.html) version [4.0.0](https://github.com/mapbox/mason/tree/master/scripts/clang-format) to consistently format the code base. The format is automatically checked via a Travis CI build as well. Run the following script locally to ensure formatting is ready to merge:
`./scripts/format.sh`
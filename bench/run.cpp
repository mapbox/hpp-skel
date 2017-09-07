#include <benchmark/benchmark.h>
#include <hello_world.hpp>

static void BM_exclaim(benchmark::State& state) {
  while (state.KeepRunning()) {
    std::string value = hello_world::exclaim("hello");
  }
}
// Register the function as a benchmark
BENCHMARK(BM_exclaim);

BENCHMARK_MAIN()
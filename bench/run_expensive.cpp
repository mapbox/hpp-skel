#include <benchmark/benchmark.h>
#include <hello_world.hpp>

static void BM_expensive(benchmark::State& state) {

  if (state.thread_index == 0) {
    // Setup code here.
  }
  while (state.KeepRunning()) {
    // Run the test as normal.
  }
  if (state.thread_index == 0) {
    // Teardown code here.
  }
}
BENCHMARK(BM_expensive)->Threads(2);
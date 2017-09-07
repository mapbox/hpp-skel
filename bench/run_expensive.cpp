#include <benchmark/benchmark.h>
#include <hello_world.hpp>

static void BM_expensive(benchmark::State& state) {

  if (state.thread_index == 0) {

  }
  while (state.KeepRunning()) {
  	std::size_t iterations = 10000;
    std::string value = hello_world::expensive(iterations);
  }
  if (state.thread_index == 0) {
    // Teardown code here.
  }
}
BENCHMARK(BM_expensive)->Threads(8);
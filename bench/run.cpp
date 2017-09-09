#include <benchmark/benchmark.h>
#include <hello_world.hpp>

static void BM_expensive(benchmark::State& state) {
  if (state.thread_index == 0) {

  }
  while (state.KeepRunning()) {
    std::string value = hello_world::expensive(static_cast<std::size_t>(state.range(0)));
  }
  if (state.thread_index == 0) {
    // Teardown code here.
  }
}

static void BM_exclaim(benchmark::State& state) {
  while (state.KeepRunning()) {
    std::string value = hello_world::exclaim("hello");
  }
}

int main (int argc, char *argv[]) {
  benchmark::RegisterBenchmark("BM_exclaim", BM_exclaim)->Threads(2)->Threads(4)->Threads(8);
  benchmark::RegisterBenchmark("BM_expensive", BM_expensive)->Threads(2)->Threads(4)->Threads(8)->Arg(1000000);
  benchmark::Initialize(&argc, argv);
  benchmark::RunSpecifiedBenchmarks();
 
  return 0;
}
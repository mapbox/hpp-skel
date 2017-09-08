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



int main (int argc, char *argv[]) {
  // int threads = std::atoi(argv[1]);
  // int busy_cycles = std::atoi(argv[2]);
  // std::cout << threads << '\n';
  // std::cout << busy_cycles << '\n';

  benchmark::RegisterBenchmark("BM_expensive", BM_expensive)->Threads(2)->Arg(1000);
  benchmark::Initialize(&argc, argv);
  benchmark::RunSpecifiedBenchmarks();
 
  return 0;
}
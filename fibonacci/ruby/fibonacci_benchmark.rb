require 'minitest/autorun'
require 'minitest/unit'
require "minitest/benchmark"

require_relative __FILE__.chomp('_benchmark.rb')

class FibonacciBenchmark < Minitest::Benchmark
  def self.bench_range
    bench_linear(0, 100, 5)
  end

  def bench_fibonacci_basic
    assert_performance_exponential 0.8 do |n|
      Fibonacci.fibonacci_basic(n)
    end
  end

  def bench_fibonacci_memoized
    assert_performance_linear 0.8 do |n|
      Fibonacci.fibonacci_memoized(n)
    end
  end

  def bench_fibonacci_iterative
    assert_performance_linear 0.8 do |n|
      Fibonacci.fibonacci_iterative(n)
    end
  end
end

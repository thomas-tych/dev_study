require 'minitest/autorun'
require 'minitest/unit'

require_relative __FILE__.chomp('_test.rb')

class FibonacciTest < Minitest::Test
  FIBONACCI_NUMBERS = [[0, 0],
                       [1, 1],
                       [2, 1],
                       [3, 2],
                       [4, 3],
                       [5, 5],
                       [6, 8],
                       [7, 13],
                       [8, 21],
                       [9, 34],
                       [10, 55],
                       [11, 89],
                       [12, 144],
                       [13, 233],
                       [14, 377],
                       [15, 610],
                       [16, 987],
                       [17, 1597],
                       [18, 2584],
                       [19, 4181],
                       [20, 6765],
                       [21, 10946],
                       [22, 17711],
                       [23, 28657],
                       [24, 46368],
                       [25, 75025]].freeze

  FIBONACCI_NUMBERS.each do |n, expected_result|
    define_method("test_that_fibonacci_basic_for_#{n}_returns_#{expected_result}") do
      assert_equal(expected_result, Fibonacci.fibonacci_basic(n))
    end

    define_method("test_that_fibonacci_memoized_for_#{n}_returns_#{expected_result}") do
      assert_equal(expected_result, Fibonacci.fibonacci_memoized(n))
    end

    define_method("test_that_fibonacci_iterative_for_#{n}_returns_#{expected_result}") do
      assert_equal(expected_result, Fibonacci.fibonacci_iterative(n))
    end
  end
end

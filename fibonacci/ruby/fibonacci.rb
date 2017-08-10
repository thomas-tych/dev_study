module Fibonacci
  # basic implementation
  def self.fibonacci_basic(n)
    return 0 if n == 0
    return 1 if n == 1 || n == 2
    return fibonacci_basic(n - 1) + fibonacci_basic(n - 2)
  end

  # memoized implementation
  @fibonacci_cache = { 0 => 0,
                       1 => 1,
                       2 => 1 }
  def self.fibonacci_memoized(n)
    @fibonacci_cache[n] ||= fibonacci_memoized(n - 1) +
                            fibonacci_memoized(n - 2)
    return @fibonacci_cache[n]
  end
  
  def self.fibonacci_iterative(n)
    return 0 if n == 0
    return 1 if n == 1 || n == 2
    f_n = 1
    f_n_1 = 1
    (3..n).each do
      cur = f_n + f_n_1
      f_n_1 = f_n
      f_n = cur
    end
    return f_n
  end
end

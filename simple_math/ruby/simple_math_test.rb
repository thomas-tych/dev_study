require 'minitest/autorun'
require 'minitest/unit'

require_relative __FILE__.chomp('_test.rb')

# Test
class SimpleMathTest < Minitest::Test
  def test_compute_on_exercise_example
    expected_output = "10 + 5 = 15\n"\
                      "10 - 5 = 5\n"\
                      "10 * 5 = 50\n"\
                      "10 / 5 = 2\n"
    assert_equal(expected_output, compute(10, 5))
  end

  def test_sanitize_rejects_non_numerical_string
    assert_raises do
      sanitize('12abc')
    end
  end

  def test_sanitize_accepts_numerical_string
    assert_equal(123, sanitize('123'))
  end

  def test_sanitize_rejects_negative_number
    assert_raises do
      sanitize('-123')
    end
  end
end

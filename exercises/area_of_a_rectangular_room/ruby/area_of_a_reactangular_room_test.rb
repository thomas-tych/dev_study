require 'minitest/autorun'
require 'minitest/unit'

require_relative __FILE__.chomp('_test.rb')

# Test
class SimpleMathTest < Minitest::Test
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

  def test_area_computes_basic_areas
    assert_equal(1, area(1, 1))
    assert_equal(2, area(1, 2))
    assert_equal(4, area(2, 2))
    assert_equal(6, area(2, 3))
  end

  def test_convert_feet2_to_meters
    assert_equal(27.871, convert_feet2_to_meter2(300))
  end

  def compute_areas
    expected_output = "You entered dimensions of 15 feet by 20 feet.\n"\
                      "The area is\n"\
                      "300 square feet\n"\
                      "27.871 square meters\n"
    assert_equal(expected_output, areas(15, 20))
  end
end

require 'minitest/autorun'
require 'minitest/unit'

require_relative __FILE__.chomp('_test.rb')

# Test HelloYou
class HelloYouTest < Minitest::Test
  def test_greet_for_brian
    expected_greet = 'Hello, Brian, nice to meet you!'
    assert_equal(expected_greet, greet('Brian'))
  end
end

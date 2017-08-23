require 'minitest/autorun'
require 'minitest/unit'

require_relative __FILE__.chomp('_test.rb')

class StringAdditiveTest < Minitest::Test
  def test_that_additive_for_empty_string_returns_0
    assert_equal(0, Hashes::String.additive(""))
  end

  def test_that_additive_for_foo_returns_324
    assert_equal(324, Hashes::String.additive("foo"))
  end

  def test_that_additive_for_oof_equals_additive_for_foo
    assert_equal(Hashes::String.additive("foo"),
                 Hashes::String.additive("oof"))
  end
end

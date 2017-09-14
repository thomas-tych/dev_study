require 'test_helper'

class NodeTest < Minitest::Test
  def test_that_a_single_node_has_no_child
    single_node = Trees::BinarySearch::Node.new(1)
    assert_nil(single_node.left)
    assert_nil(single_node.right)
  end

  def test_that_node_creation_store_value
    value = Faker::Hacker.ingverb
    single_node = Trees::BinarySearch::Node.new(value)
    assert_equal(value, single_node.value)
  end

  def test_that_equalequal_checks_for_value_equality
    value = Faker::Hacker.ingverb
    node_a = Trees::BinarySearch::Node.new(value)
    node_b = Trees::BinarySearch::Node.new(value)
    assert_equal(node_a, node_b)
  end
end

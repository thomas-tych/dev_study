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

  def test_that_leaf_return_true_if_node_has_no_child
    value = Faker::Hacker.ingverb
    node = Trees::BinarySearch::Node.new(value)

    assert(node.leaf?)
  end

  def test_that_leaf_return_false_if_node_has_a_left_child
    value = Faker::Hacker.ingverb
    node_parent = Trees::BinarySearch::Node.new(value)
    value = Faker::Hacker.ingverb
    node_child = Trees::BinarySearch::Node.new(value)

    node_parent.left = node_child

    refute(node_parent.leaf?)
  end

  def test_that_leaf_return_false_if_node_has_a_right_child
    value = Faker::Hacker.ingverb
    node_parent = Trees::BinarySearch::Node.new(value)
    value = Faker::Hacker.ingverb
    node_child = Trees::BinarySearch::Node.new(value)

    node_parent.right = node_child

    refute(node_parent.leaf?)
  end

  def test_that_leaf_return_false_if_node_has_2_children
    value = Faker::Hacker.ingverb
    node_parent = Trees::BinarySearch::Node.new(value)
    value = Faker::Hacker.ingverb
    node_left = Trees::BinarySearch::Node.new(value)
    value = Faker::Hacker.ingverb
    node_right = Trees::BinarySearch::Node.new(value)

    node_parent.left = node_left
    node_parent.right = node_right

    refute(node_parent.leaf?)
  end
end

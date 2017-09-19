require 'test_helper'

class TreeTest < Minitest::Test
  def test_that_add_creates_the_root_node_on_empty_tree
    tree = Trees::BinarySearch::Tree.new
    new_value = Faker::Number.number(5).to_i

    tree.add(new_value)
    assert_equal(new_value, tree.root.value)
  end

  def test_that_add_append_to_left_when_new_value_is_less_than_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value - 1

    tree.add(new_value)
    assert_equal(new_value, tree.root.left.value)
  end

  def test_that_add_append_to_right_when_new_value_is_greater_than_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value + 1

    tree.add(new_value)
    assert_equal(new_value, tree.root.right.value)
  end

  def test_that_add_append_to_right_when_new_value_is_equal_to_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value

    tree.add(new_value)
    assert_equal(new_value, tree.root.right.value)
  end
end

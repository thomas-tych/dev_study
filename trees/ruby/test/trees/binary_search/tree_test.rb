require 'test_helper'

class TreeTest < Minitest::Test
  def test_that_add_iterative_creates_the_root_node_on_empty_tree
    tree = Trees::BinarySearch::Tree.new
    new_value = Faker::Number.number(5).to_i

    tree.add_iterative(new_value)
    assert_equal(new_value, tree.root.value)
  end

  def test_that_add_iterative_append_to_left_for_value_less_than_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value - 1

    tree.add_iterative(new_value)
    assert_equal(new_value, tree.root.left.value)
  end

  def test_that_add_iterative_append_to_right_for_value_greater_than_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value + 1

    tree.add_iterative(new_value)
    assert_equal(new_value, tree.root.right.value)
  end

  def test_that_add_iterative_append_to_right_for_value_equal_to_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value

    tree.add_iterative(new_value)
    assert_equal(new_value, tree.root.right.value)
  end

  def test_that_add_creates_the_root_node_on_empty_tree
    tree = Trees::BinarySearch::Tree.new
    new_value = Faker::Number.number(5).to_i

    tree.add(new_value)
    assert_equal(new_value, tree.root.value)
  end

  def test_that_add_append_to_left_for_value_less_than_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value - 1

    tree.add(new_value)
    assert_equal(new_value, tree.root.left.value)
  end

  def test_that_add_append_to_right_for_value_greater_than_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value + 1

    tree.add(new_value)
    assert_equal(new_value, tree.root.right.value)
  end

  def test_that_add_append_to_right_for_value_equal_to_root_value
    root_value = Faker::Number.number(5).to_i
    root = Trees::BinarySearch::Node.new(root_value)
    tree = Trees::BinarySearch::Tree.new(root)

    new_value = root_value

    tree.add(new_value)
    assert_equal(new_value, tree.root.right.value)
  end

  def test_that_find_return_truthy_when_value_is_found
    tree = Trees::BinarySearch::Tree.new
    values = Array.new(10) { rand(100) }
    values.each { |value| tree.add(value) }

    random_value = values.sample
    assert(tree.find(random_value))
  end

  def test_that_find_return_falsy_when_value_is_not_found
    tree = Trees::BinarySearch::Tree.new
    values = Array.new(10) { rand(100) }
    values.each { |value| tree.add(value) }

    random_value = 0
    loop do
      random_value = rand(100)
      break unless values.include? random_value
    end

    refute(tree.find(random_value))
  end

  def test_that_each_pre_iterate_using_pre_order
    tree = Trees::BinarySearch::Tree.new
    values = [25, 83, 78, 37, 82, 44, 21, 73, 56, 55]
    values.each { |value| tree.add(value) }

    expected_pre_order_values = [25, 21, 83, 78, 37, 44, 73, 56, 55, 82]
    pre_order_values = []
    tree.each_pre { |value| pre_order_values << value }
    assert_equal(expected_pre_order_values, pre_order_values)
  end

  def test_that_each_pre_iterate_using_inf_order
    tree = Trees::BinarySearch::Tree.new
    values = Array.new(10) { rand(100) }
    values.each { |value| tree.add(value) }

    expected_inf_order_values = values.sort
    inf_order_values = []
    tree.each_inf { |value| inf_order_values << value }
    assert_equal(expected_inf_order_values, inf_order_values)
  end

  def test_that_each_pre_iterate_using_post_order
    tree = Trees::BinarySearch::Tree.new
    values = [25, 21, 83, 78, 37, 44, 73, 56, 55, 82, 15, 23, 12, 17, 11, 16]
    values.each { |value| tree.add(value) }

    expected_post_order_values = [11, 12, 16, 17, 15, 23, 21, 55, 56, 73, 44,
                                  37, 82, 78, 83, 25]
    post_order_values = []
    tree.each_post { |value| post_order_values << value }
    assert_equal(expected_post_order_values, post_order_values)
  end
end

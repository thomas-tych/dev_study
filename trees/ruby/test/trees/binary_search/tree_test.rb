require 'test_helper'

class TreeTest < Minitest::Test
  def test_that_add_creates_the_root_node_on_empty_tree
    tree = Trees::BinarySearch::Tree.new()
    new_value = Faker::Number.number(5)

    tree.add(new_value)
    assert_equal(new_value, tree.root.value)
  end
end

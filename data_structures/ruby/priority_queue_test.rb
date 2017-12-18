require 'minitest/autorun'
require 'minitest/unit'
require 'faker'

require_relative __FILE__.chomp('_test.rb')

class PriorityQueueTest < Minitest::Test
  def test_empty_should_return_true_on_new_and_empty_queue
    pq = PriorityQueue.new
    assert(pq.empty?)
  end

  def test_empty_should_return_false_when_has_one_element
    pq = PriorityQueue.new([1])
    refute(pq.empty?)
  end

  def test_top_should_return_value_for_queue_with_only_value
    value = Faker::Number.number
    pq = PriorityQueue.new([value])
    assert_equal(value, pq.top)
  end

  def test_top_should_return_10_for_queue_with_5_and_10
    pq = PriorityQueue.new([5, 10])
    assert_equal(10, pq.top)
  end

  def test_top_should_return_10_for_queue_with_10_and_5
    pq = PriorityQueue.new([10, 5])
    assert_equal(10, pq.top)
  end

  def test_top_should_return_41_for_queue_with_3_7_6_9_23_41_11
    pq = PriorityQueue.new([3, 7, 6, 9, 23, 41, 11])
    assert_equal(41, pq.top)
  end

  def test_push_should_insert_with_priority_new_value
    pq = PriorityQueue.new([3, 7, 6, 9, 23, 41, 11])
    pq.push(65)
    assert_equal(65, pq.top)
  end

  def test_top_should_return_lowest_value_with_min_priority_compare
    pq = PriorityQueue.new([3, 7, 6, 9, 23, 41, 11]) { |a, b| b <=> a }
    assert_equal(3, pq.top)
  end

  def test_removal_order_from_queue_respect_default_priority_order
    pq = PriorityQueue.new([2, 3, 12, 50, 11, 41, 23, 72])
    assert_equal(72, pq.pop)
    assert_equal(50, pq.pop)
    assert_equal(41, pq.pop)
    assert_equal(23, pq.pop)
    assert_equal(12, pq.pop)
    assert_equal(11, pq.pop)
    assert_equal(3, pq.pop)
    assert_equal(2, pq.pop)
  end

  def test_removal_order_from_queue_respect_priority_order
    pq = PriorityQueue.new([2, 3, 12, 50, 11, 41, 23, 72]) { |a, b| b <=> a }
    assert_equal(2, pq.pop)
    assert_equal(3, pq.pop)
    assert_equal(11, pq.pop)
    assert_equal(12, pq.pop)
    assert_equal(23, pq.pop)
    assert_equal(41, pq.pop)
    assert_equal(50, pq.pop)
    assert_equal(72, pq.pop)
  end

end

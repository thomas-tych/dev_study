# Simple parametrizable priority queue
class PriorityQueue
  attr_reader :compare

  def initialize(items = [], &block)
    @queue = [nil]
    @compare = block || _default_compare
    push_list(items) if items
  end

  def push_list(items)
    items.to_a.each { |item| push(item) } if items
    self
  end

  def push(item)
    queue.push(item)
    _reorder_from_last
    self
  end

  def top
    return nil if empty?
    queue[1]
  end

  def empty?
    return true if !queue || queue.size < 2
    false
  end

  def size
    queue.size - 1
  end

  def pop
    top_item = top
    queue.pop if size == 1
    queue[1] = queue.pop if size > 1
    _reorder_from_top
    return top_item
  end

  protected

  attr_reader :queue

  private

  def _default_compare
    ->(a, b) { a <=> b }
  end

  def _reorder_from_last
    return if size < 2
    _reorder_up_from(size)
  end

  def _reorder_up_from(index)
    while index > 1 do
      parent = index.to_i / 2
      case compare.call(queue[index], queue[parent])
      when 1 then _swap(parent, index)
      else
        break
      end
      index = parent
    end
  end

  def _reorder_from_top
    return if size < 2
    _reorder_down_from(1)
  end

  def _reorder_down_from(index)
    while index < size do
      index_1 = index * 2
      index_2 = index * 2 + 1

      cmp_1 = index_1 <= size ? compare.call(queue[index_1], queue[index]) : -1
      cmp_2 = index_2 <= size ? compare.call(queue[index_2], queue[index]) : -1

      if cmp_1 == 1 && cmp_2 == 1
        cmp_3 = compare.call(queue[index_1], queue[index_2])
        if cmp_3 >= 0
          _swap(index, index_1)
          index = index_1
        else
          _swap(index, index_2)
          index = index_2
        end
      elsif cmp_1 == 1
        _swap(index, index_1)
        index = index_1
      elsif cmp_2 == 1
        _swap(index, index_2)
        index = index_2
      else
        break
      end
    end
  end

  def _swap(index_1, index_2)
    tmp = queue[index_1]
    queue[index_1] = queue[index_2]
    queue[index_2] = tmp
  end
end

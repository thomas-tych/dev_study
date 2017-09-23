require 'pp'
require 'byebug'

module Trees
  module BinarySearch
    # reponsible for operations on BinarySearch Tree
    class Tree
      attr_reader :root

      def initialize(root = nil)
        @root = root
      end

      def add_iterative(value)
        new_node = _new_node(value)
        return _add_loop(new_node) if root
        @root = new_node
      end

      alias add add_iterative

      def find(value)
        cur = root
        while cur
          comparison = cur <=> value
          return cur if comparison.zero?
          cur = comparison > 0 ? cur.left : cur.right
        end
      end

      # cur / left / right
      def each_pre
        stack = [root].compact
        while (cur = stack.pop)
          stack.push(cur.right) if cur.right
          stack.push(cur.left) if cur.left
          yield cur.value
        end
      end

      # left / cur / right
      def each_inf
        stack = []
        cur = root
        to_left = true
        while cur
          if to_left
            while cur.left
              stack.push cur
              cur = cur.left
            end
          end

          yield cur.value

          if cur.right
            cur = cur.right
            to_left = true
          else
            cur = stack.pop
            to_left = false
          end
        end
      end

      alias each each_inf

      # left / right / cur
      def each_post
        stack = []
        cur = root
        from = nil

        while cur
          while (cur.left || cur.right)
            if from
              break if from == :right
              break if from == :left && !cur.right
              stack.push cur
              cur = from == :left ? cur.right : cur.left
            else
              stack.push cur
              cur = cur.left || cur.right
            end
            from = nil
          end

          yield cur.value

          prev, cur = cur, stack.pop
          break unless cur
          from = cur.left && cur.left.equal?(prev) ? :left : :right
        end
      end

      private

      def _new_node(value)
        Node.new(value)
      end

      def _add_loop(node)
        cur_next = root
        while (cur = cur_next)
          if node < cur
            cur_next = cur.left
            cur.left = node unless cur_next
          else
            cur_next = cur.right
            cur.right = node unless cur_next
          end
        end
      end
    end
  end
end

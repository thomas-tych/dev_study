module Trees
  module BinarySearch
    # reponsible for operations on BinarySearch Tree
    class Tree
      attr_reader :root

      def initialize(root = nil)
        @root = root
      end

      def add(value)
        if root
          _insert(value)
        else
          @root = _new_node(value)

        end
      end

      private

      def _new_node(value)
        Node.new(value)
      end

      def _insert(value)
        cur = root
        while cur
          if value < cur.value
            if cur.left
              cur = cur.left
            else
              cur.left = _new_node(value)
              cur = nil
            end
          else
            if cur.right
              cur = cur.right
            else
              cur.right = _new_node(value)
              cur = nil
            end
          end
        end
      end
    end
  end
end

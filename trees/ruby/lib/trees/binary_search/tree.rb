module Trees
  module BinarySearch
    class Tree
      attr_reader :root

      def initialize(root = nil)
        @root = root
      end

      def add(value)
        return @root = _new_node(value) unless root
        _insert(value)
      end

      private

      def _new_node(value)
        Node.new(value)
      end

      def _insert(value)

      end
    end
  end
end

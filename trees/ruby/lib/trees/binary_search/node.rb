module Trees
  module BinarySearch
    # responsible for local Node operations
    class Node
      include Comparable

      attr_accessor :left, :right
      attr_accessor :value

      def initialize(value)
        @value = value
      end

      def <=>(other)
        return value <=> other.value if other.is_a? self.class
        value <=> other
      end

      def leaf?
        return false if left || right
        true
      end

      def isolate
      end
    end
  end
end

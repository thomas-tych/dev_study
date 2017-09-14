module Trees
  module BinarySearch
    class Node
      attr_reader :left, :right
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def ==(other)
        value == other.value
      end
    end
  end
end

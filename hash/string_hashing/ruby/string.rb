module Hashes
  module String
    def self.additive(string)
      hash = 0
      string.each_char do |char|
        hash += char.ord
      end
      hash
    end
  end
end

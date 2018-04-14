#!/usr/bin/env ruby

def read_first
  print 'What is the first number? '
  gets.strip
end

def read_second
  print 'What is the second number? '
  gets.strip
end

def sanitize(input)
  number = Integer(input)
  return number if number.positive?
  raise "your input \"#{input}\" is not a positive number"
rescue ArgumentError
  raise "your input \"#{input}\" is not a numeric value"
end

def simple_math
  compute(sanitize(read_first),
          sanitize(read_second))
end

def compute(first, second)
  "#{first} + #{second} = #{first + second}\n"\
  "#{first} - #{second} = #{first - second}\n"\
  "#{first} * #{second} = #{first * second}\n"\
  "#{first} / #{second} = #{first / second}\n"
end

print simple_math if $PROGRAM_NAME == __FILE__

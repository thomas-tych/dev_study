#!/usr/bin/env ruby

def greet(name)
  "Hello, #{name}, nice to meet you!"
end

def user_from_input
  print 'What is your name? '
  gets.strip
end

puts greet user_from_input if $PROGRAM_NAME == __FILE__

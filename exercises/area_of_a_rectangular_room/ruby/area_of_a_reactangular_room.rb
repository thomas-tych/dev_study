#!/usr/bin/env ruby

FEET2_TO_METER2_FACTOR = 0.09290304

def read_length
  print 'What is the length of the room in feet? '
  gets.strip
end

def read_width
  print 'What is the width of the room in feet? '
  gets.strip
end

def sanitize(input)
  number = Integer(input)
  return number if number.positive?
  raise "your input \"#{input}\" is not a positive number"
rescue ArgumentError
  raise "your input \"#{input}\" is not a numeric value"
end

def area_length
  sanitize(read_length)
end

def area_width
  sanitize(read_width)
end

def area(length, width)
  length * width
end

def convert_feet2_to_meter2(area)
  (area * FEET2_TO_METER2_FACTOR).round(3)
end

def areas
  length = area_length
  width = area_width
  area_feet = area(length, width)

  "You entered dimensions of #{legnth} feet by #{width} feet.\n"\
  "The area is\n"\
  "#{area_feet} feet\n"\
  "#{convert_feet2_to_meter2(area_feet)} meters\n"
end

print areas if $PROGRAM_NAME == __FILE__

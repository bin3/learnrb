#!/usr/bin/env ruby -w
# coding: utf-8

puts 1.class
puts 2.3.class
puts true.class
puts false.class
puts nil.class

3.times { print 'Ruby! ' }
1.upto(9) { |x| print x }
puts

a = [3, 2, 1]
a[3] = a[2] - 1
a.each do |x|
  print x
end
puts

b = a.map { |x| x * x }
print b
puts

h = {
  :one => 1,
  :two => 2
}
h[:three] = 3
h.each do |key, value|
  print "#{key} => #{value}, "
end
puts

File.open('data.txt') do |f|
  line = f.readline
  puts line
end

def square(x)
  x * x
end

puts square(9)


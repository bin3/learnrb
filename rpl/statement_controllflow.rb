#!/usr/bin/env ruby -w
# coding: utf-8

puts "------Iterators and Enumerable Objects"
filename = "data.txt"
File.open(filename) do |f|
  f.each { |line| print line }
end
File.open(filename) do |f|
  f.each_with_index { |line,index| print "#{index}: #{line}" }
end

squares = [1, 2, 3].collect { |x| x*x }
evens = (1..10).select { |x| x%2 == 0 }
odds = (1..10).reject { |x| x%2 == 0 }
print squares
print evens
print odds
puts

data = [2, 5, 3, 4]
sum = data.inject { |sum, x| sum + x }
prod = data.inject(1.0) { |p, x| p * x }
max = data.inject { |max, x| max > x ? max : x }
puts sum
puts prod 
puts max


puts "[yield]"
def sequence(n, m, c)
  n.times do |i|
    yield m * i + c
  end
end
sequence(3, 5, 1) { |x| puts x }

def circle(r, n)
  n.times do |i|
    angle = Math::PI * 2 * i / n
    yield r * Math.cos(angle), r * Math.sin(angle)
  end
end
circle(1, 8) { |x, y| printf "(%.2f, %.2f) ", x, y }
puts

def sequence2(n, m, c)
  s = []
  n.times do |i|
    x = m * i + c
    yield x if block_given?
    s << x
  end
  s
end
sequence2(3, 5, 1) { |x| puts x }
s = sequence2(3, 5, 1)
print "#{s}\n"

puts "[Exceptions]"

def check(n)
  raise ArgumentError, "Expected n <= 10. Got #{n}" if n > 10
  n
end

begin
  puts check(7)
  puts check(11)
  puts check(110)
rescue => e
  puts "#{e.class}: #{e.message}"
  puts e.backtrace
end

puts "[Threads]"
def readfiles(filenames)
  threads = filenames.map do |f|
    Thread.new { File.read(f) }
  end
  threads.map { |t| t.value }
end
puts readfiles(['data.txt', 'data2.txt'])

puts "[Fiber]"
f = Fiber.new {
  puts "Fiber says Hello"
  Fiber.yield
  puts "Fiber says Goodbye"
}
puts "Caller says Hello"
f.resume
puts "Caller says Goodbye"
f.resume


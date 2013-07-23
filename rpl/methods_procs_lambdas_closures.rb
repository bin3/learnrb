#!/usr/bin/env ruby -w
# coding: utf-8

puts "------Methods, Procs, Lambdas and Closures"

puts "------Methods"
puts "---Variable-Length Argument List"
def max(first, *rest)
  max = first
  rest.each { |x| max = x if max < x }
  max
end
puts max(1, 2, 8, 3)
puts max(1, 2)
puts max(1 )
puts max(*[1, 3, 8, 3])

puts "---Block Arguments"
def sequence3(n, m, c, &p)
  n.times { |i| p.call(i * m + c) }
end
sequence3(3, 5, 1) { |x| puts x }

def sequence4(n, m, c, p)
  n.times { |i| p.call(i * m + c) }
end
p = Proc.new { |x| puts x }
sequence4(3, 5, 1, p) 

#!/usr/bin/env ruby -w
# coding: utf-8

puts "\u20ac\u{A5}"

puts %q(Don't worry about escaping ' characters!)
puts %Q|"How are you?", he said|

document = <<HERE
This is a string literal.
It has two lines and abruptly end...
HERE
puts document

windows = false
if windows 
  listcmd = 'dir'
else
  listcmd = 'ls'
end
listing = `#{listcmd}`
puts listing

s = '0123456789'
puts s[5,3]
puts s[5...8]
puts s[-3,3]

s = "¥1000"
s.each_char { |x| print "#{x}, " }
puts
0.upto(s.size-1) { |i| print "#{s[i]}, " }
puts
s.each_byte { |x| print "#{x}, " }
puts


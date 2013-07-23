#!/usr/bin/env ruby

puts "Hello, Matz!"
system "echo 'Hello, Matz!'"
puts "Hello," + " Matz!"
puts "Hello," << " Matz!"
puts "Hello, Matz! " * 3
3.times{ print "Hello, Matz! " } ; puts ""
puts "Hey Matz, I am runing " + `ruby -v`

hi = "Hello, Matz!"
puts hi # => Hello, Matz!

person = "Matz"
puts "Hello, #{person}!"

puts "Hello, #{ARGV[0]}!"

puts "%s, %s!" % ["Hello", "Matz"]
printf("%s, %s!\n", "Hello", "Matz")

eval "puts 'Hello, Matz!'"

#print "Who do you want to say hello to?"
#hello = gets
#puts "Hello, #{hello}!"

def hello
  puts "Hello, Matz!"
end
hello

def hello
  yield
end
hello { puts "Hello, Matz!" }

["Hello, ", "Matz!\n"].each { |e| print e }

prc = lambda { |name| puts "Hello, " + name }
prc.call "Matz!"

class Hello
  def initialize(name)
    @name = name
  end

  def hello
    puts "Hello, " + @name + "!"
  end
end

hi = Hello.new("Matz")
hi.hello


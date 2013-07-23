#!/usr/bin/env ruby -w
# coding: utf-8

require 'singleton'

puts "------Classes and Modules"

puts "------Classes"

class PointStats
  include Singleton

  def initialize
    @n, @totalX, @totalY = 0, 0.0, 0.0
  end

  def record(point)
    @n += 1
    @totalX += point.x
    @totalY += point.y
  end

  def report
    puts "Number of points created: #@n"
    puts "Average X coordinate: #{@totalX/@n}"
    puts "Average Y coordinate: #{@totalY/@n}"
  end
end

class Point
  attr_accessor :y
  #attr_accessor :x, :y
  @@cnt = 0

  alias eql? ==

  # must before initialize when using PointStats.instance.record(self)
  def x; @x; end
  def x=(value); @x = value; end

  def initialize(x, y)
    @x, @y = x, y
    @@cnt += 1
    PointStats.instance.record(self)
  end

  ORIGIN = Point.new(0, 0)
  UNIT_X = Point.new(1, 0)
  UNIT_Y = Point.new(0, 1)

  def to_s
    "(#@x, #@y)"
  end

  def +(other)
    raise TypeError, "Point argument expected. Got #{other.class}" unless other.is_a? Point
    Point.new(@x + other.x, @y + other.y)
  end

  def *(scalar)
    Point.new(@x * scalar, @y * scalar)
  end
  
  def -@
    Point.new(-@x, -@y)
  end

  def coerce(other)
    [self, other]
  end

  def [](index)
    case index
    when 0, :x, "x"; @x
    when 1, :y, "y"; @y
    else nil
    end
  end

  def each
    yield @x
    yield @y
  end

  def ==(o)
    @x == o.x && @y == o.y
  rescue
    false
  end

  include Comparable
  def <=>(o)
    return nil unless o.instance_of? Point
    @x**2 + @y**2 <=> o.x**2 + o.y**2
  end

  def add!(p)
    @x += p.x
    @y += p.y
    self
  end

  def add(p)
    q = self.dup
    q.add!(p)
  end

  def Point.sum(*points)
    x = y = 0
    points.each { |p| x += p.x; y += p.y }
    Point.new(x, y)
  end

  def self.report
    puts "Number of points created: #@@cnt"
  end
end

class Point3D < Point
  attr_accessor :z

  def initialize(x, y, z)
    super(x, y)
    @z = z
  end

  def to_s
    "(#@x, #@y, #@z)"
  end
end

p = Point.new(3, 10)
puts p
q = Point.new(p.x * 3, p.y * 2)
puts q
q.x, q.y = 3, 3
puts q
puts p + q
puts p * 2
puts(-q)
#puts p + 2 # raise error
puts 2 * p
puts [p[0], p[1], p[2], p[:x], p["x"], p[:y]]
p.each { |x| print x }; puts
puts (p == p)
puts (p == q)
puts (p == 0)
puts (p < q)
puts p.add!(q)
puts Point.sum(p, q)
puts (Point::UNIT_X + Point::UNIT_Y)
Point::report

PointStats.instance.report

puts Point3D.new(1, 2, 3)


puts "------Modules"

module Base64
  DIGITS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  
  def self.encode
  end

  def self.decode
  end
end

puts Base64::DIGITS

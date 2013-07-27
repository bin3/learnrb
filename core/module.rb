#!/usr/bin/env ruby -w
# coding: utf-8

module Mod
  include Math
  include Comparable
end

def ancestors(mod)
  puts "#{mod}.ancestors: #{mod.ancestors}"
end

module See extend self
  def dump_one(x, method)
    obj = eval("x.#{method}")
    puts "#{x}.#{method}: #{obj}"
  end

  def dump(x)
    dump_one(x, 'ancestors')
    dump_one(x, 'included_modules')
    dump_one(x, 'instance_methods')
    dump_one(x, 'private_instance_methods')
    dump_one(x, 'class_variables')
  end
end

See.dump(Math)
See.dump(Comparable)
See.dump(Mod)
See.dump(See)

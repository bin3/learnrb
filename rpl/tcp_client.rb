#!/usr/bin/env ruby -w
# coding: utf-8

require 'socket'

puts "[TCP Client]"

host, port = ARGV

TCPSocket.open(host, port) do |s|
  while line = s.gets
    puts line.chop
  end
end


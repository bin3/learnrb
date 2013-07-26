#!/usr/bin/env ruby -w
# coding: utf-8

require 'socket'

puts "[TCP Server]"

host, port = ARGV

server = TCPServer.open(host, port)
loop {
  client = server.accept
  client.puts(Time.now.ctime)
  client.close
}

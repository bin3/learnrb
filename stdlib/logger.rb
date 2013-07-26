#!/usr/bin/env ruby -w
# coding: utf-8

require 'logger'

log = Logger.new(STDOUT)

log.debug('A debug log')
log.info('A info log')
log.warn('A warn log')
log.error('A error log')
log.fatal('A fatal log')

def foo
  log = Logger.new(STDOUT)
  log.info('A info log')
end

foo


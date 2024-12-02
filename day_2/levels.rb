#!/usr/bin/env ruby
# frozen_string_literal: true
require 'debug'

def create_input
  input = []
  File.foreach('input.txt') do |line|
    line.chomp!
    input << line.split(' ').map(&:to_i)
  end
  input
end

input = create_input

def check_order(level)
  if level.uniq.length != level.length
    false
  else
    sort1 = level.sort { |a, b| a <=> b }
    sort2 = level.sort { |a, b| b <=> a }
    level == sort1 || level == sort2
  end
end

def check_spacing(level)
  level.each_with_index do |a, i|
    if level[i + 1].nil?
      return true
    end

    temp = level[i + 1]
    unless (a - temp).abs < 4
      return false
    end
  end
end

input.map! do |level|
  if check_order(level) && check_spacing(level)
    true
  else
    false
  end
end

p input
p input.count(true)

#!/usr/bin/env ruby
# frozen_string_literal: true

def separate_input
  sides = { left: [], right: [] }
  File.foreach('input.txt') do |line|
    pieces = line.split('   ')
    pieces[1] = pieces[1].chomp

    sides[:left] << pieces[0].to_i
    sides[:right] << pieces[1].to_i
  end
  sides
end

input = separate_input

# part one
sorted_left = input[:left].sort
sorted_right = input[:right].sort
index = 0
totals = []

until index == sorted_left.length
  difference = (sorted_left[index] - sorted_right[index]).abs
  totals << difference
  index += 1
end

p totals.sum

# part two

def create_hash(input)
  occurrences = {}
  input[:right].each do |num|
    if occurrences[num].nil?
      occurrences[num] = 1
    else
      occurrences[num] += 1
    end
  end
  occurrences
end

sim_right = create_hash(input)

def calculate_sim_score(right, input)
  sim_score = 0
  input[:left].each do |num|
    if right.include?(num) && right[num] > 1
      sim_score += (num * right[num])
    elsif right[num] == 1
      sim_score += num
    end
  end
  sim_score
end

p calculate_sim_score(sim_right, input)

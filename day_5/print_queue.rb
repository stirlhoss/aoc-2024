# frozen_string_literal: true
require 'debug'

input = File.readlines('./input.txt')

rules = []
updates = []
i = -1

while i < input.length - 1
  i += 1

  next if input[i] == "\n"

  rules << input[i].chomp && next if input[i].match(/\d+\|\d+/)

  updates << input[i].chomp && next if input[i].match(/\d+,\d+/)

end

updates = updates.map! do |update|
  update = update.split(',')
  update.map!(&:to_i)
end

rules = rules.map! do |rule|
  rule = rule.split('|')
  rule.map!(&:to_i)
end

updates.each do |update|
  update.each do |val|
    binding.break
  end
end

binding.break

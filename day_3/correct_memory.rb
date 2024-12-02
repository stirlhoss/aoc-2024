# frozen_string_literal: true
require 'debug'

input = File.read('input.txt')

REGEX = /mul\(\d*,\s?\d*\)|do\(\)|don't\(\)/

Memory_fixer = lambda do
  find_matches = lambda do |regex, string|
    string.scan(regex)
  end

  execute_instruction = lambda do |string|
    # exec = :* if string.match('mul')
    # exec = nil if string.match('do[nt]?')
    # exec = :*
    string.scan(/\d*/).map(&:to_i).reject(&:zero?).inject(:*)
  end

  find_ranges = lambda do |indexes|
    ranges = []
    ido = 0
    until indexes[:dont].length == 0
    dont = indexes[:dont].shift
    ido = indexes[:do].shift
    if dont < ido
      binding.break
      ranges << (dont...ido)
    elsif dont > ido
      binding.break
      ido = indexes[:do].shift until dont < ido
    end
  end
  end
  { find_matches:, execute_instruction:, find_ranges: }
end

mem = Memory_fixer.call

matches = mem[:find_matches].call(REGEX, input)

total = 0

indexes = { dont: [], do: [] }

matches.each_with_index do |match, i|
  if match == "don't()"
    indexes[:dont] << i
  elsif match == "do()"
    indexes[:do] << i
  end
end

mem[:find_ranges].call(indexes)

binding.break
matches.each { |match| total += mem[:execute_instruction].call(match) }

p total

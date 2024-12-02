# frozen_string_literal: true

require './correct_memory.rb'
require 'minitest/autorun'
require 'debug'

class TestMemory < Minitest::Test
  def setup
    @mem = Memory_fixer.call
    @regex = /mul\(\d*,\s?\d*\)|do\(\)|don't\(\)/
  end

  def test_regex
    test1 = 'mul(3,4)'
    test2 = 'mul(3,4)**mul()&mul(4, 6)'
    assert_equal ['mul(3,4)'], @mem[:find_matches].call(@regex, test1)
    assert_equal ['mul(3,4)', 'mul(4, 6)'], @mem[:find_matches].call(@regex, test2)
  end

  def test_execute_instructions
    test1 = 'mul(3,4)'
    test2 = 'mul(12,6)'

    assert_equal 12, @mem[:execute_instruction].call(test1)
    assert_equal 72, @mem[:execute_instruction].call(test2)
  end

  def test_do_dont
    test1 = 'do()'
    test2 = "don\'t()"

    assert_equal ["do()"], @mem[:find_matches].call(@regex, test1)
    assert_equal ["don\'t()"], @mem[:find_matches].call(@regex, test2)
  end
end

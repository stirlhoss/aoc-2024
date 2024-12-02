require('debug')
input = File.readlines('input.txt')
input.map!(&:chomp)

WordSearcher = lambda do |matrix|
  matches = 0

  scan_line = lambda do |line|
    line.each { |e| check_for_word.call(e) if letter_at_point.call(e) == "X" }
  end

  letter_at_point = lambda do |point|
    matrix[point[:y]][point[:x]]
  end

  check_for_word = lambda do |point|

    if Point[:translate].call(point) letter_at_point.call(point)
    end
  end
  { letter_at_point:, scan_line: }
end

Point = lambda do |x, y|
  translate = lambda do |direction|
    Point.call((x + direction[:x]), (y + direction[:y]))
  end

  { x:, y:, translate: }
end

ws = WordSearcher.call(input)

direction_left = Point.call(-1, 0)
direction_right = Point.call(1, 0)
direction_up = Point.call(0, -1)
direction_down = Point.call(0, 1)
direction_nw = Point.call(-1, -1)
direction_ne = Point.call(1, -1)
direction_se = Point.call(1, 1)
direction_sw = Point.call(-1, 1)
starting_point = Point.call(0, 0)

p(ws[:letter_at_point].call(starting_point))
next_point =  starting_point[:translate].call(direction_right)

p(ws[:letter_at_point].call(next_point))

p input

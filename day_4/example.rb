class TicTacToe
  def initialize(board)
    @board = board
  end

  def board_at(point)
    @board[point.y][point.x]
  end

  def check_win(direction, player)
    point = Point.new(1, 1)
    point = point.translate(direction)
    point = point.translate(direction)
    inverse_direction = direction.invert
    @board[0].length.times do
      point = point.translate(inverse_direction)
      return false if (board_at(point) != player)
    end
    return true
  end
end

class Point
  attr_reader(:x, :y)

  def initialize(x, y)
    @x = x
    @y = y
  end

  def translate(direction)
    Point.new((@x + direction.x), (@y + direction.y))
  end

  def invert
    Point.new((@x * -1), (@y * -1))
  end
end

board = [[true, false, false], [true, true, true], [false, false, true]]
tic = TicTacToe.new(board)
point = Point.new(1, 1)
direction = Point.new(-1, 0)
p(tic.check_win(direction, true))

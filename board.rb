class Board
  attr_accessor :board
  def initialize()
    @board = Array.new(8) { Array.new(8) { nil } }
  end

  def [](pos)
    x, y = pos
    @board[y][x]
  end

  def []=(pos, piece)
    x, y = pos
    @board[y][x] = piece
  end

  def valid?(pos)
    x, y = pos
    (0...8).cover?(x) && (0...8).cover?(y)
  end

  def empty?(pos)
    x, y = pos
    @board[y][x].nil?
  end

end

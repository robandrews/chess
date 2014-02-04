class Board

  def initialize()
    @board = Array.new(8) { Array.new(8) { nil } }
  end

  def [](pos)
    x,y = pos # if valid?(pos)
    @board[x][y]
  end

  def []=(pos, piece)
    x, y = pos # if valid?(pos)
    @board[x][y] = piece
  end

  def valid?(pos)
    x,y = pos
    (0...8).cover?(x) && (0...8).cover?(y)
  end

end

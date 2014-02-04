require './board.rb'

class Piece

  attr_accessor :color, :pos, :board

  def initialize(color, pos, board)
    @color, @pos, @board = color, pos, board
    @symbol
  end

end

class SlidingPiece < Piece

  HORIZONTAL = [[1,0], [0,1], [-1,0], [0,-1]]
  DIAG       = [[1,1], [-1,-1], [1,-1], [-1,1]]

  def moves(move_dirs)
    #return all valid moves
    possible_moves = []


    move_dirs.each do |dir|
      test_space = self.pos
      while @board.valid?(test_space)
        i, j = dir
        x, y = test_space
        possible_moves << test_space if @board.empty?(test_space)
        test_space = [x+i, y+j]
      end
    end
    possible_moves
  end


end

class Rook < SlidingPiece

  def move_dirs
    SlidingPiece::HORIZONTAL
  end

  def moves
    super(self.move_dirs)
  end

end

class Bishop < SlidingPiece

  def move_dirs
    SlidingPiece::DIAG
  end

  def moves
    super(self.move_dirs)
  end

end

class Queen < SlidingPiece

  def move_dirs
    SlidingPiece::DIAG + SlidingPiece::HORIZONTAL
  end

  def moves
    super(self.move_dirs)
  end

end



### TODO

# => Stop when hitting a piece

#### Testing Methods
b = Board.new
rook = Rook.new(:black, [3,3], b)
b[[3,3]] = rook
puts "Valid Rook Moves: #{rook.moves}"

bishop = Bishop.new(:black, [4,4], b)
b[[4,4]] = bishop
puts "Valid Bishop Moves: #{bishop.moves}"

queen = Queen.new(:black, [3,5], b)
b[[5,5]] = queen
puts "Valid Queen Moves: #{queen.moves}"


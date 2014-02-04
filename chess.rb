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


  def moves
    #return all valid moves
    possible_moves = []

    self.move_dirs.each do |dir|
      test_space = self.pos

      while @board.valid?(test_space)
        i, j = dir
        x, y = test_space

        if @board.empty?(test_space) # || other color piece
          possible_moves << test_space unless possible_moves.include? test_space
          test_space = [x+i, y+j]
        elsif test_space == self.pos
          test_space = [x+i, y+j]
        else
          break
        end
      end

    end
    possible_moves
  end


end

class SteppingPiece < Piece
  KING = [[1,1], [1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1], [0,1]]
  KNIGHT = [[1,2], [2,1], [-1,2], [2,-1], [-2,1], [1, -2], [-1,-2], [-2,-1]]

  def moves
    possible_moves = []
    self.move_dirs.each do |dir|
      i,j = dir
      x,y = self.pos
      test_space = [x+i, y+j]
      if @board.valid?(test_space) && @board.empty?(test_space)
        possible_moves << test_space
      end
    end
    possible_moves
  end
end


class Rook < SlidingPiece

  def move_dirs
    SlidingPiece::HORIZONTAL
  end

end
class Bishop < SlidingPiece

  def move_dirs
    SlidingPiece::DIAG
  end

end
class Queen < SlidingPiece

  def move_dirs
    SlidingPiece::DIAG + SlidingPiece::HORIZONTAL
  end

end

class King < SteppingPiece
  def move_dirs
    SteppingPiece::KING
  end
end

class Knight < SteppingPiece
  def move_dirs
    SteppingPiece::KNIGHT
  end
end

### TODO

# => Stop when hitting a piece

#### Testing Methods
b = Board.new
rook = Rook.new(:black, [3,3], b)
b[[3,3]] = rook

bishop = Bishop.new(:black, [4,4], b)
b[[4,4]] = bishop

queen = Queen.new(:black, [3,5], b)
b[[3,5]] = queen

king = King.new(:black, [3,4], b)
b[[3,4]] = king

knight = Knight.new(:black, [5,6], b)
b[[5,6]] = knight

puts "Valid Rook Moves: #{rook.moves}"
puts "Valid Bishop Moves: #{bishop.moves}"
puts "Valid Queen Moves: #{queen.moves}"
puts "Valid King Moves: #{king.moves}"
puts "Valid Knight Moves: #{knight.moves}"


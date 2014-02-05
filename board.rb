class Board

  #black moves up.
  attr_accessor :board
  def initialize()
    @board = Array.new(8) { Array.new(8) { nil } }
    place_pieces

    nil
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

  def place_pieces

    sym_hash = {
      :white_king   => "\u2654",
      :white_queen  => "\u2655",
      :white_rook   => "\u2656",
      :white_bishop => "\u2657",
      :white_knight  => "\u2658",
      :white_pawn   => "\u2659",

      :black_king   => "\u265A",
      :black_queen  => "\u265B",
      :black_rook   => "\u265C",
      :black_bishop => "\u265D",
      :black_knight => "\u265E",
      :black_pawn   => "\u265F"
    }

    (0...8).to_a.each do |i|
      Pawn.new(:black, [i,6], self, sym_hash[:black_pawn])
      Pawn.new(:white, [i,1], self, sym_hash[:white_pawn])
    end

    Rook.new(:black, [7,0], self, sym_hash[:black_rook])
    Rook.new(:black, [7,7], self, sym_hash[:black_rook])
    Rook.new(:white, [0,0], self, sym_hash[:white_rook])
    Rook.new(:white, [0,7], self, sym_hash[:white_rook])

    Knight.new(:black, [1,7], self, sym_hash[:black_knight])
    Knight.new(:black, [6,7], self, sym_hash[:black_knight])
    Knight.new(:white, [1,0], self, sym_hash[:white_knight])
    Knight.new(:white, [6,0], self, sym_hash[:white_knight])

    Bishop.new(:black, [2,0], self, sym_hash[:black_bishop])
    Bishop.new(:black, [5,0], self, sym_hash[:black_bishop])
    Bishop.new(:white, [2,7], self, sym_hash[:white_bishop])
    Bishop.new(:white, [5,7], self, sym_hash[:white_bishop])

    Queen.new(:black, [4,7], self, sym_hash[:black_queen])
    Queen.new(:white, [4,0], self, sym_hash[:white_queen])

    King.new(:black, [3,7], self, sym_hash[:black_king])
    King.new(:white, [3,0], self, sym_hash[:white_king])

    nil
  end

  def draw_board

    @board.each_with_index do |row|
      row.each do |piece|
        if piece.nil?
          print " "
        else
          print piece.symbol
        end
        print "."
      end
      print "\n"
    end

    nil
  end

end

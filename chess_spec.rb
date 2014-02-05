require "rspec"
require "./chess.rb"
require "./board.rb"

describe Board do
  before do
    b = Board.new
    rook = Rook.new(:black, [3,3], b)
    bishop = Bishop.new(:black, [4,4], b)
    queen = Queen.new(:white, [3,5], b)
    king = King.new(:black, [3,4], b)
    pawn1 = Pawn.new(:black, [4,6], b)
    pawn2 = Pawn.new(:black, [4,7], b)
  end
  
  it "handle rook moves" do
    rook.moves.should == [[4, 3], [5, 3], [6, 3], [7, 3], [2, 3], [1, 3], [0, 3], [3, 2], [3, 1], [3, 0]]
  end
  
  it "handles queen moves" do
    queen.moves.should == [[4, 6], [2, 4], [1, 3], [0, 2], [4, 4], [2, 6], [4, 5], [5, 5], [6, 5], [7, 5], [3, 6], [2, 5], [1, 5], [0, 5], [3, 4]]
  end
  
  it "handles king moves" do
    king.moves.should == [[4, 5], [4, 3], [2, 3], [2, 4], [2, 5], [3, 5]]
  end
  
  it "handles bishop moves" do
    bishop.moves.should == [[5, 5], [5, 3], [6, 2], [7, 1], [3, 5]]
  end
  
  it "handles pawn moves" do
    pawn1.moves.should == [[4, 5], [3, 5]]
    pawn2.moves.should == []
  end
  
end
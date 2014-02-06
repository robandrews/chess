require "./chess.rb"
require "./board.rb"
require "./player.rb"


class ChessGame

  def initialize
    @board = Board.new
    @players = []
  end

  def play

    @players << Player.new(:black)
    @players << Player.new(:white)

    checkmate = false

    until checkmate

      @players.each do |current_player|

        begin
          move = current_player.get_move
          raise "WrongColor" if @board[move[0]].color != current_player.color
        rescue
          retry
        end

        @board.move(*move)
        @board.draw_board

        if @board.checkmate?(@board.enemy_color(current_player.color))
          puts "CHECKMATE!"
          checkmate = true
        end
        break if checkmate == true
      end

    end

  end
end
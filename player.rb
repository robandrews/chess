class Player

  attr_reader :color, :name
  def initialize(color)
    @name = get_name
    @color = color
  end

  def play_turn
    move = get_input
  end

  def get_move

    begin
      print "Please enter a move (e.g. f2,f3)\n#{@color}=> "
      str = gets.chomp
      coordinates = []
      coordinates = str.match(/^([a-h]{1})([0-8]{1})\W*([a-h]{1})([0-8]{1})$/i).to_a

      raise "InvalidInput" if coordinates.empty?

    rescue
      puts "\n> "
      retry
    end

    first_pos = [Board::LETTERS.index(coordinates[1]), 8-(coordinates[2].to_i)]
    second_pos = [Board::LETTERS.index(coordinates[3]), 8-(coordinates[4].to_i)]

    return [first_pos, second_pos]

  end

  def get_name
    print "Please enter a name\n> "
    str = gets.chomp

    str
  end

end
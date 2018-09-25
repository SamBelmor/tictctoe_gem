class Player
  attr_accessor :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def ask_for_coordinates
    print "Enter your coordinates in form x,y: "
    coordinates = $stdin.gets.chomp.split(",")
    validate_coordinates_format(coordinates)
  end

  def validate_coordinates_format(coordinates)
    cooordinates = coordinates.select{|coordinate| coordinate.to_i >= 0 && coordinate.to_i < 3}
    if cooordinates.length == 2
      cooordinates
    else
      puts "Your coordinates are in wrong format"
      ask_for_coordinates
    end
  end

  def split_positions(coordinates = '')
    coordinates.split(',').map(&:to_i)
  end
end

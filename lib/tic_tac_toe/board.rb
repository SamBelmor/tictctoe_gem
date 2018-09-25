class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3){Array.new(3)}
  end

  def render_board
    @board.each do |row|
      print row
      puts
    end
  end

  def draw_symbol(coordinates, piece)
    position_x = coordinates.first.to_i
    position_y = coordinates.last.to_i
    @board[position_x][position_y] = piece
  end

  def could_draw?(coordinates)
    position_x = coordinates.first.to_i
    position_y = coordinates.last.to_i
    @board[position_x][position_y] == nil
  end

  def winning_combination?(piece)
    winning_diagonal?(piece) ||
    winning_horizontal?(piece) ||
    winning_vertical?(piece)
  end

  def winning_vertical?(piece)
    verticals.any? do |vert|
      vert.all? { |position| position == piece}
    end
  end

  def winning_horizontal?(piece)
    horizonals.any? do |horiz|
      horiz.all? {|position| position == piece}
    end
  end
  
  def winning_diagonal?(piece)
    diagonals.any? do |diag|
      diag.all? {|position| position == piece}
    end    
  end

  def horizonals
    horizontal = []
    3.times do |n|
      horizontal << [@board[0][n], @board[1][n], @board[2][n]]
    end
    horizontal
  end

  def verticals
    @board
  end

  def diagonals
    [ [@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]] ]
  end

  def full
    @board.all? do |row|
      row.none?(&:nil?)
    end
  end

end
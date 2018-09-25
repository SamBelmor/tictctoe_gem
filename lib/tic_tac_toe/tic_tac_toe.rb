require_relative 'player'
require_relative 'board'

class TicTacToe
  attr_accessor :board, :current_player, :player_one, :player_two

  def initialize
    @board = Board.new
    @player_one = Player.new("Player one", "X")
    @player_two = Player.new("Player two", "O")
    @current_player = @player_one
  end

  def play
    while !check_if_game_over
      puts "#{current_player.name} is your turn"
      board.render_board
      coordinates = current_player.ask_for_coordinates
      if board.could_draw?(coordinates)
        board.draw_symbol(coordinates, current_player.piece)
        unless check_if_game_over
          switch_players
        else
          board.render_board
        end
      else
        puts "That position it's ocupied"
      end
    end
  end

  def check_if_game_over
    check_victory || check_draw
  end

  def check_victory
    if @board.winning_combination?(@current_player.piece)
      puts "#{@current_player.name} wins"
      true
    else
      false
    end
  end

  def check_draw
    if @board.full
      puts "It's a draw"
      true
    else
      false
    end
  end

  def switch_players
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end
end

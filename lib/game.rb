# frozen_string_literal:true

require_relative './tic_tac_toe/tic_tac_toe'

class Game
  def start_game
    tic_tac_toe = TicTacToe.new
    tic_tac_toe.play
  end
end

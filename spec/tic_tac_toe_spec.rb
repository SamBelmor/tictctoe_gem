require_relative '../tic_tac_toe'

RSpec.describe TicTacToe do
  let(:tic_tac_toe) { TicTacToe.new 

  it '#check_if_game_over' do
    allow($stdin).to receive(:gets) { '1,1' }
    tic_tac_toe.check_if_game_over
    expect(tic_tac_toe.check_if_game_over).to eq(false)
  end

  it '#check_victory' do
    tic_tac_toe.check_victory
    expect(tic_tac_toe.check_victory).to eq(false)
  end

  it '#check_draw' do
    tic_tac_toe.check_draw
    expect(tic_tac_toe.check_draw).to eq(false)
  end

  it '#switch_players' do
    name_player_one = tic_tac_toe.player_one.name
    tic_tac_toe.switch_players
    expect(tic_tac_toe.current_player.name).not_to eq(name_player_one) 
  end
end

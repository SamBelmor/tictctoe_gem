require_relative '../board'
require 'pry'

RSpec.describe Board do
  let(:board) {Board.new}
  it '#render_board' do
    board.render_board
    expected_board = "[nil, nil, nil]\n[nil, nil, nil]\n[nil, nil, nil]\n"
    expect { board.render_board }.to output(expected_board).to_stdout
  end

  it 'draw symbol on board' do
    board.draw_symbol([2,0], 'x')
    board.board
    expect(board.board[2][0]).to eq('x')
  end
  
  it 'could_draw?' do
    board.could_draw?([0,0])
    expect(board.board[0][0]).to eq(nil)
  end

  it '#winning_combination?' do
    board.winning_combination?('o')
    expect(board.winning_combination?('o')).to eq(false)
  end

  it '#winning_vertical?' do
    board.winning_vertical?('x')
    expect(board.winning_vertical?('x')).to eq(false)
  end

  it '#winning_horizontal?' do
    board.winning_horizontal?('x')
    expect(board.winning_vertical?('x')).to eq(false)
  end

  it '#winning_diagonal?' do
    board.winning_diagonal?('o')
    expect(board.winning_diagonal?('o')).to eq(false)
  end

  it '#horizonals' do
    board.horizonals
    expected_array = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    expect(board.horizonals).to eq(expected_array)
  end

  it '#verticals' do
    board.verticals
    expected_array = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    expect(board.verticals).to eq(expected_array)
  end

  it '#diagonals' do
    board.diagonals
    expected_array = [[nil, nil, nil], [nil, nil, nil]]
    expect(board.diagonals).to eq(expected_array)
  end

  it '#full' do
    board.full
    expect(board.full).to eq(false)
  end
end

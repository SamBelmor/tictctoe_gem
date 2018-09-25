require_relative '../player'
require 'pry'
require 'stringio'

RSpec.describe Player do
  let(:player) {Player.new('one', 'x')}

  context 'When the user input is 0,1' do 

  before do
    $stdin = StringIO.new("0,1")
  end

  after do
    $stdin = STDIN
  end
	  it '#ask_for_coordinates' do
	    expect(player.ask_for_coordinates).to eq(['0', '1'])
	  end

	  it '#validate_coordinates_format' do
	    expect(player.validate_coordinates_format(['1','0'])).to eq(['1', '0'])
	  end
  end

  context 'when the user input is 0,2' do

  before do
    $stdin = StringIO.new("0,2")
  end

  after do
    $stdin = STDIN
  end
	  it 'split_positions' do
		  expect(player.split_positions('0,2')).to eq([0,2])
	  end
  end
end

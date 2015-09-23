require_relative 'lib/rook.rb'
require_relative 'lib/pawn.rb'
require_relative 'lib/piece.rb'
require_relative 'lib/translator'

RSpec.describe Translator do
  before do
    board = [
      [:bR, :bN, :bB, :bQ, :bK, :bB, :bN, :bR],
      [:bP, :bP, :bP, :bP, :bP, :bP, :bP, :bP],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [:wP, :wP, :wP, :wP, :wP, :wP, :wP, :wP],
      [:wR, :wN, :wB, :wQ, :wK, :wB, :wN, :wR],
    ]
    @game = Translator.new(IO.readlines("moves.txt").map{|line|line.split(' ')}, board)
  end

  it "should return the length of the list of moves to be checked" do
    expect(@game.moves_to_be_checked.length).to eq(16)
  end
end

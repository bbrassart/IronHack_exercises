require_relative 'lib/Rook.rb'
require_relative 'lib/Pawn.rb'
require_relative 'lib/Piece.rb'
require_relative 'lib/Translator.rb'

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

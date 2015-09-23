require_relative 'lib/Rook.rb'
require_relative 'lib/Pawn.rb'
require_relative 'lib/Piece.rb'
require_relative 'lib/Translator.rb'

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

Translator.new(IO.readlines("moves.txt").map{|line|line.split(' ')}, board).check_class_and_solve

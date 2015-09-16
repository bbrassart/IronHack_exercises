require_relative 'rook.rb'
require_relative 'pawn.rb'
require_relative 'piece.rb'
require_relative 'translator'
require 'io/console'

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

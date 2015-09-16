require_relative 'piece.rb'

class Rook < Piece
	def initialize(origin, destination)
		super(origin, destination)
		@name = "R"
	end
	def is_move_legal?
		if @origin[0] != @destination[0] && @origin[1] != @destination[1]
			puts "The move is ILLEGAL"
		elsif @origin == @destination
			puts "The move is ILLEGAL"
		else
			puts "The move is LEGAL"
		end
	end
end

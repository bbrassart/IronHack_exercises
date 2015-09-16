require_relative 'piece.rb'

class Pawn < Piece
	def initialize(origin, destination)
		super(origin, destination)
		@name = "P"
	end
	def is_move_legal?
		if ( (@origin[1] == (@destination[1] + 1) && @origin[0] == @destination[0] && @origin[1] == 6 ) || ( @origin[1] == (@destination[1] + 2) && @origin[0] == @destination[0] && @origin[1] == 6 ) )
			puts "The move is LEGAL"
		elsif ( (@origin[1] == (@destination[1] - 1) && @origin[0] == @destination[0] && @origin[1] == 1 ) || ( @origin[1] == (@destination[1] - 2) && @origin[0] == @destination[0] && @origin[1] == 1 ) )
			puts "The move is LEGAL"
		elsif @origin == @destination
			puts "The move is ILLEGAL"
		else
			puts "The move is ILLEGAL"
		end
	end
end

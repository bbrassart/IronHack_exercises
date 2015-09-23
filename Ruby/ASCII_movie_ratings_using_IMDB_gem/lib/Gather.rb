class Gather
	attr_accessor :list
	def initialize
		@list_unformatted = []
		@list = []
	end

	def gather_movies
		@list_unformatted.push IO.readlines("movies.txt", "r")
		@list = @list_unformatted[0].join.split("\n")
		Display.new(@list).process()
	end
end

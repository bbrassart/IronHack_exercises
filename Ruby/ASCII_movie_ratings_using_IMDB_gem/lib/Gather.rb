class Gather
	def initialize
	end

	def gather_movies
		list_unformatted = []
		list_unformatted.push IO.readlines("movies.txt", "r")
		list = list_unformatted[0].join.split("\n")
	end
end

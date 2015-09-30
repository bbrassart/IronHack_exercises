class Library
	def initialize
		@list = []
	end

	def number_of_items(string)
		string_results = Imdb::Search.new(string).movies.count
	end

	def most_seasons_from(array)
		array.each do |item|
			id = Imdb::Search.new(item).movies[0].id
			@list.push	Imdb::Serie.new(id)
			@list.sort! do |a,b|
				(b.seasons.size <=> a.seasons.size)
			end
		end
		@list[0].title
	end

	def most_episodes_from(array)
		array.each do |item|
			id = Imdb::Search.new(item).movies[0].id
			@list.push	Imdb::Serie.new(id)
			@list.sort! do |a,b|
				(b.episodes.size <=> a.episodes.size)
			end
		end
		@list[0].title
	end

	def best_rating_from(array)
		array.each do |item|
			id = Imdb::Search.new(item).movies[0].id
			@list.push	Imdb::Movie.new(id)
			@list.sort! do |a,b|
				(b.rating <=> a.rating)
			end
		end
		@list[0].title
	end

	def best_rating_ever(number)
		movie =[]
		movie = Imdb::Top250.new.movies.take(number)
		dictionary = {}
		movie.each do |item|
			dictionary[item.title] = item.rating
		end
		puts dictionary.inspect
		puts dictionary
		dictionary
	end
end

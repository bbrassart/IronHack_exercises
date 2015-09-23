class Display
	def initialize(movies_list)
		@movies_list = movies_list
		@queries = []
	end

	def process
		puts "Processing your request. This may take a while"
		@movies_list.each_with_index do |movie, index|
			@queries[index] = Imdb::Search.new(movie)
		end
		output = ''
		display_ratings(@queries)
		display_numbers_line(@queries)
		show_movie_names()
	end

	def display_ratings(results)
		10.downto(1) do |line_number|
			line_output = "|"
			results.each do |result|
				line_output += (result.movies[0].rating >= line_number)? "#":" "
				line_output += "|"
			end
			puts line_output
		end
	end

	def display_numbers_line(results)
		numbers_output = "|"
		results.each_with_index do |result, index|
			numbers_output +=  "#{index+1}"
			numbers_output += "|"
		end
		numbers_output += "\n"
		puts numbers_output
	end

	def show_movie_names
		puts "\n"
		@movies_list.each_with_index do |movie, index|
			puts "#{index+1}. #{movie}"
		end
	end
end

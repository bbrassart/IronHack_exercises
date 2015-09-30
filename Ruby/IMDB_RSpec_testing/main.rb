require 'imdb'
require_relative 'lib/Library.rb'

puts Library.new().number_of_items("Cat")
puts Library.new().most_seasons_from(["Breaking Bad", "Friends", "Games of Thrones", "The Office"])
puts Library.new().most_seasons_from(["Breaking Bad", "Friends", "Games of Thrones", "The Office"])
puts Library.new().best_rating_from(["Breaking Bad", "The Affair", "Pacific Blue"])

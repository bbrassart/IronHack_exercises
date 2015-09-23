require 'imdb'
require_relative 'lib/Gather.rb'
require_relative 'lib/Display.rb'
#In order to test properly the classes, I didn't automatically called the Display class inside the gather_movies method
list = Gather.new().gather_movies()
Display.new(list).process()

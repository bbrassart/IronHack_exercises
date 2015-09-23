require 'imdb'
require_relative 'lib/Gather.rb'
require_relative 'lib/Display.rb'

Gather.new().gather_movies()

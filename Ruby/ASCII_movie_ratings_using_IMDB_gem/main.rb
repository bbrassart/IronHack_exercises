require 'imdb'
require_relative 'lib/Gather.rb'
require_relative 'lib/Display.rb'

Display.new( Gather.new().gather_movies() ).process()

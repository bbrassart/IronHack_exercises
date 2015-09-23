require_relative 'robotcontender.rb'
require_relative 'referee.rb'
require_relative 'robocage.rb'

RoboCage.new([RoboContender.new("Robocop"), RoboContender.new("Terminator")]).introduction

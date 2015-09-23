require_relative 'lib/Robotcontender.rb'
require_relative 'lib/Referee.rb'
require_relative 'lib/Robocage.rb'

RoboCage.new([RoboContender.new("Robocop"), RoboContender.new("Terminator")]).introduction

require './lib/Gameintelligence.rb'
require './lib/Room.rb'
require './lib/Player.rb'
require 'pry'

player = Player.new
player.instructions()

room1 = Room.new("The first room, the Far West! You should go east...", ["Axe"])
room2 = Room.new("Land of the Middle, always better to go east unless you wanna go back to the Far West", ["Brush"])
room3 = Room.new("You're in the far East. You should see below what there is or leave...", [])
room4 = Room.new("You nearly touched the bottom... Getting dark... Wanna go deeper?...", ["Knife"])
room5 = Room.new("End of the tunnel, touched the bottom... You won, go back north if you want", [])

room1.doors = {:E => room2}
room2.doors = {:W => room1, :E => room3}
room3.doors = {:W => room2, :S => room4}
room4.doors = {:N => room3, :S => room5}
room5.doors = {:N => room4}



new_game = GameIntelligence.new([room1, room2, room3, room4, room5], player)
new_game.difficulty_select()

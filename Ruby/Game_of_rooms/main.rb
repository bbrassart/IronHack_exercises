require './lib/Gameintelligence.rb'
require './lib/Room.rb'
require './lib/Player.rb'

player = Player.new
player.instructions()

GameIntelligence.new([   Room.new("The first room, the Far West! You should go east...", ["E"], 0, ["Axe"]),
    Room.new("Land of the Middle, always better to go east unless you wanna go back to the Far West", ["E", "W"], 1, ["Brush"]),
    Room.new("You're in the far East. You should see below what there is or leave...", ["S", "W"], 2, []),
    Room.new("You nearly touched the bottom... Getting dark... Wanna go deeper?...", ["S", "N"], 3, ["Knife"]),
    Room.new("End of the tunnel, touched the bottom... Go south to escape", ["S"], 4, [])
], player).difficulty_select()

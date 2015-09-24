require_relative 'lib/Gameintelligence.rb'
require_relative 'lib/Player.rb'
require_relative 'lib/Room.rb'

RSpec.describe Player do
  before do
    @player = Player.new
  end

  it "should return the default value of hard mode" do
    expect(@player.hard_mode).to be_falsey
  end

  it "should return an empty inventory" do
    expect(@player.inventory.empty?). to be_truthy
  end
end

RSpec.describe GameIntelligence do
  before do
    @game =
    GameIntelligence.new([   Room.new("The first room, the Far West! You should go east...", ["E"], 0, ["Axe"]),
        Room.new("Land of the Middle, always better to go east unless you wanna go back to the Far West", ["E", "W"], 1, ["Brush"]),
        Room.new("You're in the far East. You should see below what there is or leave...", ["S", "W"], 2, []),
        Room.new("You nearly touched the bottom... Getting dark... Wanna go deeper?...", ["S", "N"], 3, ["Knife"]),
        Room.new("End of the tunnel, touched the bottom... Go south to escape", ["S"], 4, [])
    ], Player.new)
  end

  it "should return the hint of the first room" do
    expect(@game.rooms[0].hint).to eq("The first room, the Far West! You should go east...")
  end

  it "should return the location of the fourth room" do
    expect(@game.rooms[4].location).to eq(4)
  end
end

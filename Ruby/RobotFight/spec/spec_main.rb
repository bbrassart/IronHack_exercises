require_relative "../lib/Robocage.rb"
require_relative "../lib/Robotcontender.rb"
require_relative "../lib/Referee.rb"

RSpec.describe RoboCage do
  before do
    @cage = RoboCage.new([RoboContender.new("Robocop"), RoboContender.new("Terminator")])
  end

  it "should return the length of the contenders" do
    expect(@cage.contenders.length).to eq(2)
  end

  it "should return the name of the first robot" do
    expect(@cage.contenders[0].name).to eq("Robocop")
  end

  it "should return the life points of the second robot" do
    expect(@cage.contenders[1].life_points).to eq(200)
  end
end

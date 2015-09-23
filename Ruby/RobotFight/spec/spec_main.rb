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
end

require_relative 'lib/Gather.rb'
require_relative 'lib/Display.rb'

RSpec.describe Gather do
  before do
    @list = Gather.new().gather_movies()
  end

  it "should return the movies list length" do
    expect(@list.length).to eq(6)
  end

  it "should NOT return the wrong number of movies added to the list" do
    expect(@list.length).not_to eq(9)
  end

  it "should return the first name of the movies list" do
    expect(@list[0]).to eq("Die Hard")
  end
end

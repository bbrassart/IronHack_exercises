require 'imdb'
require_relative 'lib/Library.rb'

RSpec.describe Library do
	before do
    @library = Library.new
  end

	describe "#number of items" do
    it "Should return the number of items" do
       expect(@library.number_of_items("Cat")).to eq(200)
    end
  end

  	describe "#most seasons" do
    it "Should return the series with the most seasons" do
       expect(@library.most_seasons_from(["Breaking Bad", "Friends", "Games of Thrones", "The Office"])).to include("Friends")
    end
  end

    	describe "#most episodes" do
    it "Should return the series with the most episodes" do
       expect(@library.most_seasons_from(["Breaking Bad", "Friends", "Games of Thrones", "The Office"])).to include("Friends")
    end
  end

      describe "#compare ratings" do
    it "Should return the show that has the best rating" do
       expect(@library.best_rating_from(["Breaking Bad", "The Affair", "Pacific Blue"])).to include("Breaking Bad")
    end
  end

      describe "#best_rating_ever" do
    it "Should return with hash movie name and rating" do
       expect(@library.best_rating_ever(3).keys[1]).to include("padrino")
    end
  end
end

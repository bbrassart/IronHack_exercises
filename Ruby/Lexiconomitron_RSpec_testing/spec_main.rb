require_relative 'lib/Lexiconomitron.rb'

RSpec.describe Lexiconomitron do
	before do
    @my_testing_instance = Lexiconomitron.new
  end

  describe "#trigonometry removes t" do
    it "Should remove all the t in all the words" do
       expect(@my_testing_instance.remove_t(["try", 'trigonometry'])).to eq(['ry', 'rigonomery'])
    end
  end

	describe "#shazam method reverses words" do
    it "Should reverses letters order and return only first and last words" do
       expect(@my_testing_instance.shazam(['This', 'is','a', 'boring','test'])).to eq(['sih', 'se'])
    end
  end

  describe "#oompa_loompa return words wih 3 or less characters" do
  	it "Should return words composed of 3 or less characters in right order" do
  		expect(@my_testing_instance.oompa_loompa(['if', 'you', 'wanna', 'be', 'my', 'lover'])).to eq(['if', 'you', 'be', 'my'])
  	end
  end

  describe "#all_in_line sort words by length then add separator between words" do
  	it "Should return a string with words from biggest to smallest and with a separator between words" do
  		expect(@my_testing_instance.all_in_line(['words', 'are', 'tremendously', 'nice'], '$')).to eq("remendously$words$nice$are")
  	end
  end

   describe "#supercounter the final method" do
  	it "Should return the number of letters, within all those words, that appear before t in alphabet" do
  		expect(@my_testing_instance.supercounter(['I', 'am', 'getting', 'tired', 'of', 'your', 'words'])).to eq(20)
  	end
  end


# The final method “supercounter”. Taking ¡an array of words!, it returns the number of letters, within
# all those words, that appear before “t” in the alphabet. For example, given [“I”, “am”, “getting”, “tired”, “of”,
#“your”, “words”], it would return 20.
end

require_relative 'lib/Converter.rb'

describe Converter do
	before do
    	Converter.new
  	end

	describe "#automatic_conversion" do
		it "Should convert one euro into dollars" do
			expect(Converter.convert(1, 'eur', 'usd')).to eq(1.28356)
		end

		it "Should convert one dollar into euros" do
			expect(Converter.convert(1, 'usd', 'eur')).to eq(0.77818)
		end

		it "Should convert 35 cad into euros" do
			expect(Converter.convert(35, 'cad', 'eur')).to eq(24.6813)
		end

		it "Should convert 10 dollars in eur" do
			expect(Converter.convert(10, 'usd', 'eur')).to eq(7.7818)
		end
	end

	describe "convert non euros to non euros" do
		it "Should convert 50 usd into cad" do
			expect(Converter.from_other_to_other(50, 'usd', 'cad')).to eq(55.10020217)
		end
	end
end



# But just before getting into the subway, we found a bag full of money in different currencies!
#  write an awesome currency converter

# You already have a little skeleton class with currency exchanges from and to €. Note that converting from/to € is direct,
#but if none of the from/to currencies is the € you have to do two conversions, using the € as a bridge.

# The only condition is: write ALL the tests first. Go full TDD on it.

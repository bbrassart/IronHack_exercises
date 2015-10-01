require_relative './models.rb'

describe User do

	before do
		@sharon = User.new
		@sharon.name = "Sharon"
		@sharon.handle = "sharebear"
		@sharon.password = "730571638493760"
	end

  it "should be valid with correct data" do
    	expect(@sharon.valid?).to be_truthy
	end

	describe :name do
		it "should be invalid with no name" do
			@sharon.name = nil
			expect(@sharon.valid?).to be_falsy
		end
	end

	describe :handle do
		it "should be invalid if not unique" do
			@sharon.save
			@karen = User.new
			@karen.name = "karen"
			@karen.handle = "sharebear"
			@karen.password = "92746392729303827281"
				expect(@karen.valid?).to be_falsy
		end
	end

		describe :handle do
			it "should be invalid with no handle" do
				@sharon.handle = nil
					expect(@sharon.valid?).to be_falsy
			end
		end

	describe :password do
		it "should be invalid when not unique" do
			@karen = User.new
			@karen.name = "karen"
			@karen.handle = "sharebear"
			@karen.password = "doodles"
					expect(@karen.valid?).to be_falsy
		end
	end

	describe :password do
		it "should be invalid when not present" do
			@sharon.password = nil
				expect(@sharon.valid?).to be_falsy
		end
	end
end

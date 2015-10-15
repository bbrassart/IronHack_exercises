class Player
	attr_accessor :inventory, :name

	def initialize(name = nil)
		@inventory = []
		@name = nil
	end

end

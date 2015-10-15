class Room
	attr_accessor :hint, :doors, :inventory

	def initialize(hint, inventory)
		@hint = hint
		@doors = {}
		@inventory = inventory
	end
end

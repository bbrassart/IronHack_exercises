class Room
	attr_accessor :hint, :doors, :location, :inventory

	def initialize(hint, doors, location, inventory)
		@hint = hint
		@doors = doors
		@location = location
		@inventory = inventory
	end
end

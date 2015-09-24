class Player
	attr_accessor :hard_mode, :inventory
	def initialize
		@hard_mode = false
		@inventory = []
	end

	def instructions
		puts "What is your name?"
		name = gets.chomp.capitalize!
		puts "\nHello #{name}! Please read those instructions: press I to pick an item, D to drop an item, N to go North, S to go South, E to go East or W to go West\n"
		intro()
	end

	def invalid_keys?(user_choice)
		valid_keys = ["Hard", "Easy"]
		!valid_keys.include?(user_choice)
	end

	def intro
		puts "\nFor the hard mode, press 'hard', for the easy mode, press 'easy'\n"
		user_choice = gets.chomp.capitalize
		while invalid_keys?(user_choice)
			puts "Ooops.... Please select level hard or easy\n"
			user_choice = gets.chomp.capitalize
			puts user_choice
		end
		if user_choice == 'Hard'
			@hard_mode = true
			puts "\nWelcome to the Hard Level\n"
		elsif user_choice == 'Easy'
			puts "\nWelcome to the Easy Level\n"
		end
	end
end

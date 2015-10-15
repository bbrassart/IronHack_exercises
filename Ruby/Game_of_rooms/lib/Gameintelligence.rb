class GameIntelligence

	SAVING_DIVIDER = "|||"
	MODE_VALID_KEYS = ["HARD", "EASY"]
	VALID_KEYS = ["N", "S", "E", "W", "P", "D", "SHOW", "SAVE", "LOAD", "EXIT"]

	def initialize(rooms, player, hard_mode = false)
		@rooms = rooms
		@lives = 5
		@player = player
		@hard_mode = hard_mode
	end

	def instructions
		puts "What is your name?"
		@player.name = gets.chomp.capitalize
		puts "\nHello #{@player.name}! Please read those instructions: press EXIT to exit, SAVE to save the game, LOAD to load a previous game, press I to pick an item, D to drop an item, N to go North, S to go South, E to go East or W to go West\n"
		intro
	end

	def mode_invalid_keys?(user_choice)
		!MODE_VALID_KEYS.include?(user_choice)
	end

	def intro
		load_prompt
		puts "\nFor the hard mode, press 'HARD', for the easy mode, press 'EASY'\n"
		user_choice = gets.chomp.upcase
		while mode_invalid_keys?(user_choice)
			puts "Ooops.... Please select level hard or easy\n"
			user_choice = gets.chomp.upcase
			puts user_choice
		end
		if user_choice == 'HARD'
			@hard_mode = true
			puts "\nWelcome to the Hard Level\n"
			core_gameplay(@rooms[0])
		elsif user_choice == 'EASY'
			puts "\nWelcome to the Easy Level\n"
			core_gameplay(@rooms[0])
		end
	end

	def invalid_key?(user_choice)
		!VALID_KEYS.include?(user_choice)
	end

	def loose_life
		@lives -= 1
	end

	def game_over?
		@lives <= 1
	end

	def load_prompt
		puts "Type LOAD to load an existing game. Type any other key to start"
		user_input = gets.chomp.upcase
		if user_input == "LOAD"
			load_game
		end
	end

	def save_game_state(room)
		current_state = "#{room.hint}#{SAVING_DIVIDER}"
		if @hard_mode
			current_state += "hard#{SAVING_DIVIDER}"
		end
		if @player.inventory
			@player.inventory.each do |item|
				current_state += "#{item}#{SAVING_DIVIDER}"
			end
		end
		File.open("lib/game_saved.txt", "w") do |file|
			file.write(current_state)
		end
		puts "Game successfully saved"
		core_gameplay(room)
	end

	def load_game
		saved_elements = IO.read("lib/game_saved.txt").chomp.split(SAVING_DIVIDER)
		if saved_elements.length > 0
			hint = saved_elements[0]
			saved_elements.shift
			if saved_elements.include?("hard")
				@hard_mode = true
				saved_elements.shift
			end
			current_room = @rooms.select do |room|
				room.hint == hint
			end
			puts "Welcome back"
			if saved_elements
				restore_inventory(saved_elements)
			end
		else
			puts "Sorry, no games were saved. You start at level One"
			core_gameplay(@rooms[0])
		end
	end

	def restore_inventory(saved_elements)
		saved_elements.each do |item|
			@player.inventory.push(item)
		end
		puts "Inventory restored"
		core_gameplay(current_room[0])
	end

	def preview_room(room)
		unless @hard_mode
			puts "The doors are located #{room.doors.keys}"
		end
	end

	def pick_item(inventory)
		puts "The inventory of this room contains #{inventory.join(", ")}"
		puts "What item do you wanna pick? Just type the name of the item"
		user_choice = gets.chomp.capitalize
		while !inventory.include?(user_choice)
			puts "Please, type the name of an item..."
			user_choice = gets.chomp.capitalize
		end
		word_index = inventory.index(user_choice)
		@player.inventory.push(inventory[word_index])
		inventory.slice!(word_index)
	end

	def drop_item(room_inventory)
		puts "Your inventory currently contains #{@player.inventory.join(", ")}"
		puts "What item do you wanna drop in the room? Just type the name of the item"
		user_choice = gets.chomp.capitalize
		while !@player.inventory.include?(user_choice)
			puts "Please, type the name of an item..."
			user_choice = gets.chomp.capitalize
		end
		word_index = @player.inventory.index(user_choice)
		room_inventory.push(@player.inventory[word_index])
		@player.inventory.slice!(word_index)
	end

	def show_inventory
		if @player.inventory.empty?
			puts "You don't have any thing yet..."
		else
			puts "Your inventory consists of #{@player.inventory.join(', ')}"
		end
	end

	def core_gameplay(room)
		preview_room(room)
		puts room.hint
		user_choice = gets.chomp.upcase
		while invalid_key?(user_choice)
			puts "\nOoops.... Please type N, E, S or W to move or P to pick an item or D to drop an item or SHOW to show your inventory"
			user_choice = gets.chomp.upcase
		end
		if game_over?
			puts "\nGAAMMMEEE OOOVVVVERRRR!!!!!"
			exit
		end
		check_next_action(user_choice, room)
	end

	def check_next_action(user_choice, room)
		if user_choice == "SAVE"
			save_game_state(room)
		elsif user_choice == "EXIT"
			exit
		elsif user_choice == 'P'
			init_pick_item(room)
		elsif user_choice == 'D'
			init_drop_item(room)
		elsif user_choice == 'SHOW'
			show_inventory
			core_gameplay(room)
		else
			move_process(room, user_choice)
		end
	end

	def init_pick_item(room)
		unless !room.inventory.empty?
			puts "There's no nothing to pick here"
			core_gameplay(room)
		end
		pick_item(room.inventory)
		core_gameplay(room)
	end

	def init_drop_item(room)
		unless !@player.inventory.empty?
			puts "Your inventory is currently empty"
			core_gameplay(room)
		end
		drop_item(room.inventory)
		core_gameplay(room)
	end

	def move_process(room, user_choice)
		if next_room = room.doors[user_choice.upcase.to_sym]
				core_gameplay(next_room)
		else
			loose_life
			puts "\nYo.. You went the wrong way. You still have #{@lives} lives left,. Please try again : "
			core_gameplay(room)
		end
	end
end

class GameIntelligence
	def initialize(rooms, player)
		@rooms = rooms
		@lives = 5
		@player = player
	end

	def invalid_key?(user_choice)
		valid_keys = ["N", "S", "E", "W", "P", "D", "SHOW"]
		!valid_keys.include?(user_choice)
	end

	def loose_life
		@lives -= 1
	end

	def game_over?
		@lives <= 1
	end

	def difficulty_select
		unless @player.hard_mode
			easy_mode(@rooms[0])
		end
		hard_mode(@rooms[0])
	end

	def easy_mode(room)
		core_gameplay(room)
	end

	def hard_mode(room)
		core_gameplay(room)
	end

	def preview_room(room)
		unless @player.hard_mode
			puts "The doors are located #{room.doors}"
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
		if user_choice == 'P'
			unless !room.inventory.empty?
				puts "There's no nothing to pick here"
				core_gameplay(room)
			end
			pick_item(room.inventory)
			core_gameplay(room)
		elsif user_choice == 'D'
			unless !@player.inventory.empty?
				puts "Your inventory is currently empty"
				core_gameplay(room)
			end
			drop_item(room.inventory)
			core_gameplay(room)
		elsif user_choice == 'SHOW'
			show_inventory()
			core_gameplay(room)
		else
			move_process(room, user_choice)
		end
	end

	def move_process(room, user_choice)
		if (room.location >= @rooms.count - 1) && (room.doors[0] == user_choice)
			puts "\nYou just finished the game! Congrats!"
			exit
		elsif (room.doors[0] == user_choice)
				core_gameplay(@rooms[room.location + 1])
		elsif (room.doors[1] == user_choice)
			core_gameplay(@rooms[room.location - 1])
		else
			loose_life
			puts "\nYo.. You went the wrong way. You still have #{@lives} lives left,. Please try again : "
			core_gameplay(room)
		end
	end
end

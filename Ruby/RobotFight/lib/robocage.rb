class RoboCage
  attr_accessor :contenders
  #just for the sake of RSpec testing

  def initialize(contenders)
    @contenders = contenders
    @referee = Referee.new
  end

  def introduction
    puts "Hello! Two robots are trapped in a cage. It's a two-player game so player 1 goes first. Each player has a robot with 200 points of life."
    puts "The moves are poor (damage: 5), weak (damage: 10), strong (damage: 20) and definitve (damage: 50)."
    puts "If you're scared to play, type EXIT, otherwise, press any key\n>>"
    choice = gets.chomp
    if choice == "EXIT"
      exit
    else
      start_round
    end
  end

  def start_round
    puts "Player 1: move #{@contenders[0].name} now. Which move do you want for the first robot?\n>>"
    robot1_move = gets.chomp
    puts "Player 2: move #{@contenders[1].name} now. Which move do you want for the next robot?\n>>"
    robot2_move = gets.chomp
    valid_moves(robot1_move, robot2_move)
    process(robot1_move, robot2_move)
  end

  def process(robot1_move, robot2_move)
    @referee.check_moves(robot1_move, robot2_move)
    apply_damage(robot1_move, robot2_move)
    check_game_over
    start_round
  end

  def print_life(player1, player2)
    puts "Player 1 now has #{player1.life_points} points remaining"
    puts "Player 2 now has #{player2.life_points} points remaining\n"
  end


  def valid_moves(robot1_move, robot2_move)
    if @referee.moves[robot1_move.to_sym] == nil || @referee.moves[robot2_move.to_sym] == nil
      puts "One of the commands was wrong. Please type poor, weak, strong or definitive"
      start_round
    end
  end

  def apply_damage(robot1_move, robot2_move)
    if @referee.decision == 2
      print_life(@contenders[0], @contenders[1])
    elsif @referee.decision == 3
      @contenders.each do |contender|
        contender.life_points -= (@referee.moves[robot1_move.to_sym]) * 2
      end
      print_life(@contenders[0], @contenders[1])
    else
      @contenders[0].life_points -= @referee.moves[robot2_move.to_sym]
      @contenders[1].life_points -= @referee.moves[robot1_move.to_sym]
      print_life(@contenders[0], @contenders[1])
    end
    # reset referee's decision to 0 for the next round
    @referee.decision = 0
  end

  def check_game_over
    @contenders.each do |contender|
      if contender.life_points <= 0
        puts "Game Over"
        exit
      end
    end
  end
end

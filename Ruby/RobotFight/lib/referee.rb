class Referee
  attr_accessor :moves, :decision
  def initialize
    @decision = 0
    @moves = {:poor => 5, :weak => 10, :strong => 20, :definitive => 50}
  end

  def check_moves(robot1_move, robot2_move)
    weak_attack_null(robot1_move, robot2_move)
    strong_double(robot1_move, robot2_move)
    definitive_double(robot1_move, robot2_move)
  end

  end

  def weak_attack_null(robot1_move, robot2_move)
    if (@moves[robot1_move.to_sym] == 10 ) && (@moves[robot2_move.to_sym] == 10 )
      puts "Both players played weakly, that's a draw"
      @decision = 2
    end
  end

  def strong_double(robot1_move, robot2_move)
    if @moves[robot1_move.to_sym] == 20 && @moves[robot2_move.to_sym] == 20
      puts "Damage will be double"
      @decision = 3
    end
  end

  def definitive_double(robot1_move, robot2_move)
    if @moves[robot1_move.to_sym] == 50 && @moves[robot2_move.to_sym] == 50
      puts "Game Over because of fatal attack"
      exit
    end
  end
end

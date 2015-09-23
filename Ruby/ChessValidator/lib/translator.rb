class Translator
  attr_accessor :moves_to_be_checked
  def initialize(moves_to_be_checked, board)
    @moves_to_be_checked = moves_to_be_checked
    @board = board
  end

  def check_class_and_solve
    @moves_to_be_checked.each do |move|
      origin_x = move[0].split(//)[0].ord - 97
      origin_y = move[0].split(//)[1].to_i - 1
      destination_x = move[1].split(//)[0].ord - 97
      destination_y = move[1].split(//)[1].to_i - 1
      if @board[origin_y][origin_x] == nil
        puts "You cannot do such move"
      elsif @board[origin_y][origin_x].to_s.include? "R"
        puts "You want to move your pawn #{@board[origin_y][origin_x].to_s} from #{move[0].split(//)[0]}#{move[0].split(//)[1].to_i} to #{move[1].split(//)[0]}#{move[1].split(//)[1]}. Is it legal? "
        puts "Let's check if that ROOK move is legal"
        Rook.new( [origin_x, origin_y] , [destination_x, destination_y]).is_move_legal?
      elsif @board[origin_y][origin_x].to_s.include? "P"
        puts "You want to move your pawn #{@board[origin_y][origin_x].to_s} from #{move[0].split(//)[0]}#{move[0].split(//)[1].to_i} to #{move[1].split(//)[0]}#{move[1].split(//)[1]}. Is it legal? "
        puts "Let's check if that PAWN move is legal"
        Pawn.new( [origin_x, origin_y] , [destination_x, destination_y]).is_move_legal?
      else
        puts "My AI doesn't allow me to move other pawns yet. Stay tuned.."
      end
    end
  end
end

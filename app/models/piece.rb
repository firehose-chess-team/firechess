class Piece < ApplicationRecord

  belongs_to :player
  belongs_to :game
  has_many :moves


  def is_obstructed?(x_target, y_target)
    x_position_change = (x_target - position_x).abs
    y_position_change = (y_target - position_y).abs
    # is the path valid
   if boundaries(x_target,y_target) == false
    puts "#{self.inspect} moving to #{x_target}, #{y_target}"
    raise 'Outside of bounds of game'
   end

    # is the path horizontal
    if  y_position_change == 0 && x_position_change > 0

     check_horizontal(x_target, y_target)
    
    # is the path vertical
    elsif x_position_change == 0 && y_position_change > 0

      check_vertical(x_target, y_target)

    # is the path diaganol
    elsif x_position_change == y_position_change

      check_diaganol(x_target, y_target) 

    else    
     
      return false
      
    end

  end  


  def is_occupied?(x, y)
    # this will search the pieces database and see if x, y are occupied already 

    Piece.exists?(game_id: game_id, position_x: x, position_y: y)
  end

  # this should enable pawn check if it can move diagonally and take piece
  def check_diagonal?(x_target, y_target)

    x = position_x
    y = position_y

    # left to right - bottom to top
    if x < x_target && y < y_target
      while x < x_target do
        x = x + 1
        y = y + 1
        return true if is_occupied?(x, y)
      end       
    end

    # right to left - bottom to top
    if x > x_target && y < y_target
      while x > x_target do 
        x = x - 1
        y = y + 1
        return true if is_occupied?(x, y)
      end
    end

    # left to right top to bottom
    if x < x_target && y > y_target
      while x < x_target do 
        x = x + 1
        y = y - 1
        return true if is_occupied?(x, y)
      end
    end

    # right to left - top to bottom
    if x > x_target && y > y_target
      while x_target > x_target do
        x = x - 1
        y = y - 1
        return true if is_occupied?(x, y)
      end
    end
    return false
  end




end





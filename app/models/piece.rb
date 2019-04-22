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

end





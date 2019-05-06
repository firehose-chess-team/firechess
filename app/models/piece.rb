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

  def move_to!(new_x, new_y)
    #check to see if there is a piece ('blocking piece') in location already
    blocking_piece_array = Piece.where(position_x: new_x, position_y: new_y)
    array_length = blocking_piece_array.length
    if array_length > 0
      blocking_piece = blocking_piece_array.take 
      #if blocking piece is same color, return error message
      if blocking_piece.piece_color == @piece_color
        raise 'invalid move: cannot replace your own piece'
      end
      #if blocking piece is opposite color, set block piece's coordinates to nil
      blocking_piece.update_attributes(position_x: nil, position_y: nil)  
    end
    #update active piece's position to new coordinates
    update_attributes(position_x: new_x, position_y: new_y)
      
  end


end





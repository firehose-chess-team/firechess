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

  def boundaries(x, y)
    #need to make sure the move stays with the chess board boundaries
    return false if x > 7 || x < 0 || y > 7 || y < 0
    return true
  end

  def captured!(new_x, new_y)
    next_move = Piece.exists?(game_id: game_id, position_x: new_x, position_y: new_y).first
    if defined?(next_move.piece_color)
      if(next_move.piece_color == piece_color)
        return false
      else
        next_move.update_attributes(position_x: nil, position_y: nil, captured: true)
      end  
  end


  




end





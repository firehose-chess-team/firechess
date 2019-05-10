class Bishop < Piece


    def diagonal_move_right?(x, y)
      (self.position_x + self.position_y) == (x + y)
    end

    def diagonal_move_left?(x, y)  
      (self.position_x - self.position_y) == (x - y)
    end

    def is_obstructed?(x, y)

    end

   # def valid_move?(x, y)
    #   ((self.position_x - self.position_y) == (x - y) || (self.position_x + self.position_y) == (x + y))
           # is_obstructed? to be added

    #end

    def valid_move?(x, y)
      return false if is_obstructed?(x, y)
      diagonal_move_left?(x, y) || diagonal_move_right?(x,y)
    
    end 

end

class Bishop < Piece


    #def initialize(x, y, image_url)
     #   @image_url = image_url
      #  @x = x
       # @y = y
    #end

    def valid_move?(x, y)
       if ((self.position_x - self.position_y) == (x - y) || (self.position_x + self.position_y) == (x + y))
           # is_obstructed? to be added

            return true
        else
            return false
        end
    end

end

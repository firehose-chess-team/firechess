class Bishop < Piece

    def initialize(x, y, image_url)
        @image_url = image_url
        @x = x
        @y = y
    end

    def valid_move?(x, y, number)
      if ((@y - @x) == (y - x) || (@y + @x) == (y + x))
        return true
      else
        return false
    end

end

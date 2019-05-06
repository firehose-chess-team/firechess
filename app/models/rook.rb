class Rook < Piece


    def initialize(x, y, image_url)
        @image_url = image_url
        @x = x
        @y = y
    end

    def valid_move?(x, y)
      if x == (0..7) && x != x && y == @y
        return true
      elsif x == @x && y == (0..7) && y != y
        return true
      else
        return false
      end
   end
end

class King < Piece

   # def initialize(x, y, image_url)
    #    @image_url = image_url
     #   @x = x
      #  @y = y
   # end

    def valid_move?(x, y)
      #[position_x+1, position_x-1].include?(x) && (0..7).include?(x) && [position_y+1, position_y-1].include?(y) && (0..7).include?(y)
      (position_x - x).abs <= 1 && (position_y - y).abs <= 1
    end
  
end

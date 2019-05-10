class King < Piece

  def valid_move?(x, y)
    def initialize(x, y, image_url)
        @image_url = image_url
        @x = x
        @y = y
    end

    def valid_move?(x, y)
      [@x+1, @x-1].include?(x) && (0..7).include?(x) && [@y+1, @y-1].include?(y) && (0..7).include?(y)
    end
  end
end

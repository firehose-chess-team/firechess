class Queen < Piece
  # def initialize(x, y)
    #  @x = x
    #  @y = y
  # end

  def valid_move?(x, y)
    if (self.position_x - x).abs == (self.position_y - y).abs
      return true
    elsif self.position_x == x && self.position_y != y
      return true
    elsif self.position_x != x && self.position_y == y
      return true
    else
      return false
    end
  end

end

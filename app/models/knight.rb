class Knight < Piece

  def valid_move?(x, y)
    (position_x - x).abs == 2 && (position_y - y).abs == 1 || (position_x - x).abs == 1 && (position_y - y).abs == 2
  end
end
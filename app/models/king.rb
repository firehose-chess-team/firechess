class King < Piece

  

    def valid_move?(x, y)
      (position_x - x).abs <= 1 && (position_y - y).abs <= 1
    end
end


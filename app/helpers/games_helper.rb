module GamesHelper
   def piece_image(type, color)
     image_tag "#{color}-#{type}.gif"    
  end

  def get_piece(pieces, row, column)
      pieces.find do |piece|
        piece_in_row_and_column?(piece, row, column)
    end
  end

  def piece_in_row_and_column?(piece, row, column)
    piece && row == piece.position_x && column == position_y      
  end

  def link_to_piece(piece)
    @piece_id = piece.id if piece 
    @piece_type = piece.type if piece
  end

end

class Pawn < Piece

  def horizontal_move?(x)
    x_move = (x - position_x).abs
    x_move != 0
  end

  def move_up?(x, y)
    (y - position_y) > 0 && piece_color == 'white'
  end

  def move_down?(x, y)
    (y - position_y) < 0 && piece_color == 'black'
  end

  def move_one_space?(x, y)
    if move_up?(x, y) || move_down?(x, y)
      (x - position_x).abs.zero? && (y - position_y).abs == 1
    else
      false
    end
  end

  def move_two_spaces?(x, y)
    if move_up?(x, y) || move_down?(x, y)
      (x - position_x).abs.zero? && (y - position_y).abs == 2 && has_moved != true
    else
      false
    end
  end

  def single_diagonal_move?(x, y)
    (x - position_x).abs == 1 && (y - position_y).abs == 1
  end

  def capture_diagonal?(x, y)
    check_diagonal?(x, y) && single_diagonal_move?(x,y)

  end

  def valid_move?(x, y)
    return false if horizontal_move(x) && !check_diagonal?(x, y)
    return false if is_occupied?(x, y) && !check_diagonal?(x, y)
    return false if is_obstructed?(x, y) && !check_diagonal?(x, y)
    move_one_space?(x, y) || move_two_spaces?(x, y) || capture_diagonal?(x, y)
  end

  def check_diagonal?(x_target, y_target)

    x = position_x
    y = position_y

    # left to right - bottom to top
    if x < x_target && y < y_target
      while x < x_target do
        x = x + 1
        y = y + 1
        return true if is_occupied?(x, y)
      end       
    end

    # right to left - bottom to top
    if x > x_target && y < y_target
      while x > x_target do 
        x = x - 1
        y = y + 1
        return true if is_occupied?(x, y)
      end
    end

    # left to right top to bottom
    if x < x_target && y > y_target
      while x < x_target do 
        x = x + 1
        y = y - 1
        return true if is_occupied?(x, y)
      end
    end

    # right to left - top to bottom
    if x > x_target && y > y_target
      while x_target > x_target do
        x = x - 1
        y = y - 1
        return true if is_occupied?(x, y)
      end
    end
    return false
  end

  def is_occupied?(x, y)
    # this will search the pieces database and see if x, y are occupied already 

    Piece.exists?(game_id: game_id, position_x: x, position_y: y)
  end

  

end
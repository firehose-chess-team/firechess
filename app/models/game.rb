class Game < ApplicationRecord

  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
  has_many :pieces

  def setup_pieces
    (1..8).each do |num|
      pieces.create(type: 'Pawn', position_x: num, position_y: 2)
    end 

    (1..8).each do |num|
      Pawn.create(player: black_player, position_x: num, position_y: 7)
    end 

  [1, 8].each do |num|
    Rook.create(player: white_player, position_x: num, position_y: 1)
  end 

  [1, 8].each do |num|
    Rook.create(player: black_player, position_x: num, position_y: 8)
  end 

  [2,7].each do |num|
    Knight.create(player: white_player, position_x: num, position_y: 1)
  end 

  [2,7].each do |num|
    Knight.create(player: black_player, position_x: num, position_y: 8)
  end 

  [3,6].each do |num|
    Bishop.create(player: white_player, position_x: num, position_y: 1)
  end 

  [3,6].each do |num|
    Bishop.create(player: black_player, position_x: num, position_y: 8)
  end 

  Queen.create(player: white_player, position_x: 4, position_y: 1)

  Queen.create(player: black_player, position_x: 4, position_y: 8)

  King.create(player: white_player, position_x: 5, position_y: 1)
  
  King.create(player: black_player, position_x: 5, position_y: 8)
end 


end

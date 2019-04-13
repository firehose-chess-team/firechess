class Game < ApplicationRecord

  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
  has_many :pieces

  def setup_pieces
    (1..8).each do |num|
      pieces.create(type: 'Pawn', position_x: num, position_y: 2)
    end 

    (1..8).each do |num|
      pieces.create(type: 'Pawn', player: black_player, position_x: num, position_y: 7)
    end 

    [1, 8].each do |num|
      pieces.create(type: 'Rook', player: white_player, position_x: num, position_y: 1)
    end 

    [1, 8].each do |num|
      pieces.create(type: 'Rook', player: black_player, position_x: num, position_y: 8)
    end 

    [2, 7].each do |num|
      pieces.create(type: 'Knight', player: white_player, position_x: num, position_y: 1)
    end 

    [2, 7].each do |num|
      pieces.create(type: 'Knight', player: black_player, position_x: num, position_y: 8)
    end 

    [3, 6].each do |num|
      pieces.create(type: 'Bishop', player: white_player, position_x: num, position_y: 1)
    end 

    [3,6].each do |num|
      pieces.create(type: 'Bishop', player: black_player, position_x: num, position_y: 8)
    end 

    pieces.create(type: 'Queen', player: white_player, position_x: 4, position_y: 1)

    pieces.create(type: 'Queen', player: black_player, position_x: 5, position_y: 8)

    pieces.create(type: 'King', player: white_player, position_x: 5, position_y: 1)
  
    pieces.create(type: 'King', player: black_player, position_x: 4, position_y: 8)
  end 


end

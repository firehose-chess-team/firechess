class Game < ApplicationRecord

  before_create :initialize_board!

  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
  has_many :pieces
  has_many :players

  def initialize_board!
    (1..8).each do |num|
      pieces.create(type: 'Pawn', game_id: self.id, player_id: white_player, position_x: num, position_y: 2)
    end 

    (1..8).each do |num|
      pieces.create(type: 'Pawn', game_id: self.id, player: black_player, position_x: num, position_y: 7)
    end 

    [1, 8].each do |num|
      pieces.create(type: 'Rook', game_id: self.id, player: white_player, position_x: num, position_y: 1)
    end 

    [1, 8].each do |num|
      pieces.create(type: 'Rook', game_id: self.id, player: black_player, position_x: num, position_y: 8)
    end 

    [2, 7].each do |num|
      pieces.create(type: 'Knight', game_id: self.id, player: white_player, position_x: num, position_y: 1)
    end 

    [2, 7].each do |num|
      pieces.create(type: 'Knight', game_id: self.id, player: black_player, position_x: num, position_y: 8)
    end 

    [3, 6].each do |num|
      pieces.create(type: 'Bishop', game_id: self.id, player: white_player, position_x: num, position_y: 1)
    end 

    [3,6].each do |num|
      pieces.create(type: 'Bishop', game_id: self.id, player: black_player, position_x: num, position_y: 8)
    end 

    pieces.create(type: 'Queen', game_id: self.id, player: white_player, position_x: 4, position_y: 1)

    pieces.create(type: 'Queen', game_id: self.id, player: black_player, position_x: 5, position_y: 8)

    pieces.create(type: 'King', game_id: self.id, player: white_player, position_x: 5, position_y: 1)
  
    pieces.create(type: 'King', game_id: self.id, player: black_player, position_x: 4, position_y: 8)
  end




end

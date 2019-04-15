class Game < ApplicationRecord

  after_create :initialize_board

  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
  has_many :pieces
  has_many :players

  def piece_start(x, y)
    pieces.where(position_x: x, position_y: y)
  end

  def initialize_board
    (1..8).each do |num|
      pieces.create(type: 'Pawn', game_id: self.id, player_id: white_player, position_x: num, position_y: 2, piece_color: 'white')
    end 

    (1..8).each do |num|
      pieces.create(type: 'Pawn', game_id: self.id, player_id: black_player, position_x: num, position_y: 7, piece_color: 'black')
    end 

    [1, 8].each do |num|
      pieces.create(type: 'Rook', game_id: self.id, player_id: white_player, position_x: num, position_y: 1, piece_color: 'white')
    end 

    [1, 8].each do |num|
      pieces.create(type: 'Rook', game_id: self.id, player_id: black_player, position_x: num, position_y: 8, piece_color: 'black')
    end 

    [2, 7].each do |num|
      pieces.create(type: 'Knight', game_id: self.id, player_id: white_player, position_x: num, position_y: 1, piece_color: 'white')
    end 

    [2, 7].each do |num|
      pieces.create(type: 'Knight', game_id: self.id, player_id: black_player, position_x: num, position_y: 8, piece_color: 'black')
    end 

    [3, 6].each do |num|
      pieces.create(type: 'Bishop', game_id: self.id, player_id: white_player, position_x: num, position_y: 1, piece_color: 'white')
    end 

    [3,6].each do |num|
      pieces.create(type: 'Bishop', game_id: self.id, player_id: black_player, position_x: num, position_y: 8, piece_color: 'black')
    end 

    pieces.create(type: 'Queen', game_id: self.id, player_id: white_player, position_x: 4, position_y: 1, piece_color: 'white')

    pieces.create(type: 'Queen', game_id: self.id, player_id: black_player, position_x: 5, position_y: 8, piece_color: 'black')

    pieces.create(type: 'King', game_id: self.id, player_id: white_player, position_x: 5, position_y: 1, piece_color: 'white')
  
    pieces.create(type: 'King', game_id: self.id, player_id: black_player, position_x: 4, position_y: 8, piece_color: 'black')
  end




end

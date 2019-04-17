class Game < ApplicationRecord

  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
  has_many :pieces
  has_many :players

  after_create :initialize_board!

  scope :available, -> { where(player_white_id: nil) }

  def piece_at(x, y)
    pieces.where(position_x: x, position_y: y)
  end

  def initialize_board!
    (0..7).each do |num|
      Pawn.create(game_id: self.id, player_id: self.white_player_id, position_x: num, position_y: 1, piece_color: 'white')
    end 

    (0..7).each do |num|
      Pawn.create(game_id: self.id, player_id: self.black_player_id, position_x: num, position_y: 6, piece_color: 'black')
    end 

    [0, 7].each do |num|
      Rook.create(game_id: self.id, player_id: self.white_player_id, position_x: num, position_y: 0, piece_color: 'white')
    end 

    [0, 7].each do |num|
      Rook.create(game_id: self.id, player_id: self.black_player_id, position_x: num, position_y: 7, piece_color: 'black')
    end 

    [1, 6].each do |num|
      Knight.create(game_id: self.id, player_id: self.white_player_id, position_x: num, position_y: 0, piece_color: 'white')
    end 

    [1, 6].each do |num|
      Knight.create(game_id: self.id, player_id: self.black_player_id, position_x: num, position_y: 7, piece_color: 'black')
    end 

    [2, 5].each do |num|
      Bishop.create(game_id: self.id, player_id: self.white_player_id, position_x: num, position_y: 0, piece_color: 'white')
    end 

    [2, 5].each do |num|
      Bishop.create(game_id: self.id, player_id: self.black_player_id, position_x: num, position_y: 7, piece_color: 'black')
    end 

    Queen.create(game_id: self.id, player_id: self.white_player_id, position_x: 3, position_y: 0, piece_color: 'white')

    Queen.create(game_id: self.id, player_id: self.black_player_id, position_x: 4, position_y: 7, piece_color: 'black')

    King.create(game_id: self.id, player_id: self.white_player_id, position_x: 4, position_y: 0, piece_color: 'white')
  
    King.create(game_id: self.id, player_id: self.black_player_id, position_x: 3, position_y: 7, piece_color: 'black')
  end




end

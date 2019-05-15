class Game < ApplicationRecord

  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
  has_many :pieces
  has_many :players

  after_create :initialize_board!

  scope :available, -> { where(player_white_id: nil) }

  attr_accessor(:king, :king_x, :king_y)

  def piece_at(x, y)
    pieces.find_by(position_x: x, position_y: y)
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

  def in_check?(player)

    if player == black_player
      @king = pieces.where(type: 'King', player_id: black_player).first
      @king_x = @king.position_x #should this be @king_x or king_x ??
      @king_y = @king.position_y #should this be @king_y or king_y ??
        white_player.pieces.where(game: self.id).each do |piece|
        if piece.type != 'King'
          if is_valid_move_and_capture?(piece, @king) == true
            @check_piece = @piece
            return true
          end
        end
      end
      return false
    end

    if player == white_player
      @king = pieces.where(type: 'King', player_id: white_player).first
      @king_x = @king.position_x #should this be @king_x ??
      @king_y = @king.position_y #should this be @king_y ??
        black_player.pieces.where(game: self.id).each do |piece|
        if piece.type != 'King'
          if is_valid_move_and_capture?(piece, @king) == true
            @check_piece = @piece
            return true
          end
        end
      end
      return false
    end

  end

  def is_valid_move_valid_capture?(piece, capture_piece)   #could i hard code @king here for capture piece?
  
        # is the move valid and capture valid - needs to be built for all pieces
      if piece.valid_move?(capture_piece.position_x, capture_piece.position_y) == true && piece.is_capture_valid?(capture_piece.position_x, capture_piece.position_y) == true                  
        @piece = piece
        return true
      end  
  
      return false
    
  end


end

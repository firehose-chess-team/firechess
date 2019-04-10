class Piece < ApplicationRecord

  belongs_to :player
  belongs_to :game
  has_many :moves

end

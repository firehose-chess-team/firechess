require 'rails_helper'

RSpec.describe Pawn do 
  subject(:my_piece) { Piece.create(game: game, position_x: piece_x, position_y: piece_y)}
  

  let(:player) { Player.create(name: 'one', email: 'two', password: 'three')}
  let(:game) { Game.create(white_player: player, black_player: player)}
  let(:piece_x) { 6 }
  let(:piece_y) { 1 }
  

  end 

  describe '#check_diagonal?' do
    subject(:test_diagonal) { my_piece.check_diagonal?(x_target, y_target) }

    before do 
      Piece.create(game: game, position_x: 2, position_y: 2)
    end

    context 'a piece is on the diagonal' do
      let(:x) { 1 }
      let(:y) { 1 }
      it { is_expected eq true}
    end


  end

end
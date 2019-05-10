require 'rails_helper'

RSpec.describe Piece do 
  subject(:my_piece) { Piece.create(game: game, position_x: piece_x, position_y: piece_y)}
  

  let(:player) { Player.create(name: 'one', email: 'two', password: 'three')}
  let(:game) { Game.create(white_player: player, black_player: player)}
  let(:piece_x) { 6 }
  let(:piece_y) { 1 }
  

  describe '#is_occupied?' do
    subject(:test_occupy) { my_piece.is_occupied?(x, y) }

    before do
      Piece.create(game: game, position_x: 1, position_y: 1)
    end

    context 'a piece is on the position' do
      
        let(:x) { 1 }
        let(:y) { 1 }
      it { is_expected.to eq true}
    end

    context 'a piece is not on the position' do
      let(:x) { 4 }
      let(:y) { 3 }
      it { is_expected.to eq false}
    end

  end 

  

end
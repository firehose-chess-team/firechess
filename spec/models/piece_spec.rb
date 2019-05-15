require 'rails_helper'

RSpec.describe Piece do 
 # subject(:my_piece) { Piece.create(type: type, game: game, position_x: piece_x, position_y: piece_y)}
  

  #let(:player) { Player.create(name: 'one', email: 'two', password: 'three')}
  #let(:game) { Game.create(white_player: player, black_player: player)}
  #let(:piece_x) { 6 }
  #let(:piece_y) { 1 }
  #let(:type) {'rook'}

  #describe '#is_occupied?' do
   # subject(:test_occupy) { my_piece.is_occupied?(x, y) }

    #before do
    #  Piece.create(game: game, position_x: 1, position_y: 1)
    #end

    #context 'a piece is on the position' do
      
     #   let(:x) { 1 }
      #  let(:y) { 1 }
      #  it { is_expected.to eq true}
    #end

    #context 'a piece is not on the position' do
     # let(:x) { 4 }
     # let(:y) { 3 }
     # it { is_expected.to eq false}
    #end

  #end 

  before(:each) do 
    player = FactoryBot.build(:player)
    game = FactoryBot.build(:game)
    @piece = FactoryBot.build(:rook, position_x: 4, position_y: 4, game: @game, player: @player)
  end

    describe "move_to!(new_x, new_y)" do
    it "should give a runtime error can't capture your own piece" do
      
      expect{piece.move_to!(3,1)}.to raise_error(RuntimeError)
    end
       it "should move and update the position" do
      piece = FactoryBot.create(:rook, position_x: 2, position_y: 1, piece_color: 'black',)
      piece.move_to!(2,2)
      expect([piece.position_x,piece.position_y]).to eq([2,2])
    end
  end
  

end
require 'rails_helper'

RSpec.describe Pawn: :model do 

  before(:each) do 
    game = FactoryBot.build(:game)
    player = FactoryBot.build(:player)
    @pawn = FactoryBot.build(:pawn, position_x: 4, position_y: 4, game: @game, player: @player, piece_color: @color)
    end

  
  describe '#move_one_space?' do
    context 'pawn is white' do
      let(:color) {'white'}
      #let(:x) {1}
      #let(:y) {1}
      it 'should return true if pawn can move one space' do 
        expect(@pawn.move_one_space?(4, 5)).to eq true
      end
  
      it 'should return false if the pawn moves more then 1 space' do 
        expect(@pawn.move_one_space?(4, 6)).to eq false
      end
    end

    context 'pawn is black' do
      let(:color) {'black'}
      #let(:x) {6}
      #let(:y) {6}
      it 'should return true if pawn can move one space' do 
        expect(@pawn.move_one_space?(6, 5)).to eq true
      end
  

      it 'should return false if the pawn moves more then 1 space' do 
        expect(@pawn.move_one_space?(6, 4)).to eq true
      end
    end


  


    describe '#move_two_spaces?' do 
      it 'should return true if the pawn moves two places' do 
        expect(@pawn.move_two_spaces?(1, 3)).to eq true
      end

      it 'should return false if already moved' do
        @pawn.move_to!(1, 2) #do i need this?
        expect(@pawn.move_two_spaces?(1, 4)).to eq false
      end
    end

    describe '#capture_diagonal?' do
      #do i need black and white pawns? 
      end
    end

    describe '#valid_move?' do 
      it ' should return true for 1 space move with no obstruction' do 
        expect(@pawn.valid_move?(1, 2)).to eq true
      end

      it 'should return true for 2 space move with no obstruction' do 
        expect(@pawn.valid_move?(1, 3)).to eq true
      end
    end

end







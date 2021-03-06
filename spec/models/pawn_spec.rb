require 'rails_helper'

RSpec.describe Pawn: :model do 

  let(:pawn) {FactoryBot.build(:pawn, position_x: x, position_y: y, game: game, player: player, piece_color: color)}
  let(:game)  {FactoryBot.build(:game)}
  let(:player)  {FactoryBot.build(:player)}
  
  

  describe '#move_one_space?' do
    context 'pawn is white' do
      let(:color) {'white'}
      let(:x) {1}
      let(:y) {1}
      it 'should return true if pawn can move one space' do 
        expect(pawn.move_one_space?(1, 2)).to eq true
      end
    end
    

    it 'should return false if the pawn moves more then 1 space' do 
      expect(@pawn.move_one_space?(1, 3)).to eq true
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

  describe '#valid_move?' do 
    it ' should return true for 1 space move with no obstruction' do 
      expect(@pawn.valid_move?(1, 2)).to eq true
    end

    it 'should return true for 2 space move with no obstruction' do 
      expect(@pawn.valid_move?(1, 3)).to eq true
    end


  end






end
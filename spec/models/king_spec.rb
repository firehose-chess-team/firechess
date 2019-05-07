require 'rails_helper'

RSpec.describe King: :model do 
  before(:each) do 
    game = FactoryBot.build(:game)
    player = FactoryBot.build(:player)
    @king = FactoryBot.build(:king, position_x: 3, position_y: 0, game: @game, player: @player)
  end

  describe '#valid_move?' do
    it "should return true if king move is valid" do 
      expect(@king.valid_move?(4,0)).to eq true
    end

    it "should return fslse if the king move is invalid" do 
      expect(@king.valid_move?(6,3)).to eq false
    end
  end

end
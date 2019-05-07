require 'rails_helper'

RSpec.describe King, type: :model do 
  before(:all) do 
    @game = FactoryBot.build(:game, id: 2)
    @user = FactoryBot.build(:player, id: 2)
    @king = FactoryBot.build(:king, position_x: 3, position_y: 0, game_id: game.id, user_id: 2)
  end

  describe '#valid_move?' do
    it "should return true if king move is valid" do 
      expect(@king.valid_move?(4,1)). to eq true
    end

    it "should return fslse if the king move is invalid" do 
      expect(@king.valid_move?(6,3)).to eq false
    end
  end

end
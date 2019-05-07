require 'rails_helper'

RSpec.describe Queen, type: :model do

  before(:all) do
    game = FactoryBot.build(:game)
    player = FactoryBot.build(:player)

    @queen = FactoryBot.create(:queen, game_id: 1, black_player_id: 4, position_x: 3, position_y: 0)
    
  end

  describe "valid queen move?" do
    it "should check the horizontal move and return true" do
      expect(queen.valid_move?(5,0)).to eq(true)
    end

    it "should check the vertical move and return true" do
      expect(queen.valid_move?(3,3)).to eq(true)
    end

    it "should check the diagonal move and return true" do
      expect(queen.valid_move?(4,1)).to eq(true)
    end

   
  end
end
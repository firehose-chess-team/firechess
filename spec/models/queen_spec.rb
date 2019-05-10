require 'rails_helper'

RSpec.describe Queen: :model do

  before(:each) do
    game = FactoryBot.build(:game)
    player = FactoryBot.build(:player)
    @queen = FactoryBot.build(:queen, position_x: 3, position_y: 0, game: @game, player: @player)
    
  end

  describe "valid queen move?" do
    it "should check the horizontal move and return true" do
      expect(@queen.valid_move?(5,0)).to eq true
    end

    it "should check the vertical move and return true" do
      expect(@queen.valid_move?(3,3)).to eq true
    end

    it "should check the diagonal move and return true" do
      expect(@queen.valid_move?(4,1)).to eq true 
    end

   
  end
end
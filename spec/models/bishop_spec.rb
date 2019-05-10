require 'rails_helper'

RSpec.describe Bishop: :model do
  before(:each) do
    game = FactoryBot.build(:game)
    player = FactoryBot.build(:player)
    @bishop = FactoryBot.build(:bishop, position_x: 4, position_y: 4, game: @game, player: @player)
  end

  describe '#valid_move?' do

    it "should return true if the bishop move is valid( diagonal up right)" do
      expect(@bishop.valid_move?(5,5)).to eq true
    end

    it "should return true if the bishop move is valid( diagonal up left)" do
      expect(@bishop.valid_move?(3,5)).to eq true
    end

    it "should return true if the bishop move is valid( diagonal down right)" do 
      expect(@bishop.valid_move?(5,3)).to eq true
    end

    it "should return true if the bishop move is valid( diagonal down left)" do 
      expect(@bishop.valid_move?(5,3)).to eq true
    end

    it "should return false if the bishop move is invalid" do
      expect(@bishop.valid_move?(1,4)).to eq false
    end
  end

end
require 'rails_helper'

RSpec.describe Rook, type: :model do  


  before(:all) do 
    game = FactoryBot.build(:game, white_player_id: 3, black_player_id: 4)
    player = FactoryBot.build(:player)
    @rook = FactoryBot.build(:rook, position_x: 3, position_y: 5)      
  end

  describe "rook valid_move?" do
    
    it "should return true if the rook move is valid (vertical)" do
      expect(@rook.valid_move?(3,7)).to eq true
    end

    it "should return true if the rook move is valid (horizontal)" do
      expect(@rook.valid_move?(7,5)).to eq true
    end

    
    it "should return false if the rook move is not valid " do
      expect(@rook.valid_move?(0,0)).to eq false
      expect(@rook.valid_move?(5,2)).to eq false
    end

  
  end
  
end
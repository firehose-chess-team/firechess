require 'rails_helper'

RSpec.describe Knight, type: :model do
   
   before(:all) do 
    game = FactoryBot.build(:game, white_player_id: 3, black_player_id: 4)
    player = FactoryBot.build(:player)
    @knight = FactoryBot.build(:knight, position_x: 2, position_y: 2)      
    end

  describe "knight valid_move?" do
    
    it "should return true if the knight piece move is valid (vertical)" do
      expect(@knight.valid_move?(4,3)).to eq(true)
      expect(@knight.valid_move?(3,4)).to eq(true)
      expect(@knight.valid_move?(1,0)).to eq(true)
      expect(@knight.valid_move?(0,1)).to eq(true)
    end

    it "should return false if the knight piece move is not valid (horizontal or vertical)" do
      
       expect(@knight.valid_move?(7,0)).to eq(false)
       expect(@knight.valid_move?(5,4)).to eq(false)
       expect(@knight.valid_move?(2,7)).to eq(false)
       expect(@knight.valid_move?(1,1)).to eq(false)
    end
    
  end

end
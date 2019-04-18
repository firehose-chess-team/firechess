class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def index
    @game = Game.all


  def create
    @game = Game.create(game_params)
    
  end

  def show
    debugger
    @game = Game.find(2)
    @pieces = @game.pieces
  end

  
  
  
  private
  
  def game_params
    params.require(:game).permit(:id, :white_player_id, :black_player_id )
  end


 end

end
  
  
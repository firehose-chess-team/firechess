class GamesController < ApplicationController

  def new
    @game = Game.new
  end
  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.all
    end
  end

  
  
  
  private
  
  def game_params
    params.require(:game).permit(:white_player_id, :black_player_id )
  end


 


  
  
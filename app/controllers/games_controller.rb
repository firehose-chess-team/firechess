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
    @game = Game.find(params[:id])

    end
  end

  
  
  
  private
  
  def game_params
    params.require(:game).permit(:white_player_id, :black_player_id )
  end


 end


  
  
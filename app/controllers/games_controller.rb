class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def index
    @game = Game.all
  end

  def create
    @game = Game.create(game_params)
    
  end

  def show
    
    @game = Game.find(2)
    @pieces = @game.pieces
  end

  def update
    @game = Game.find(2)
    if current_player 
      @game.update(white_player_id: current_player.id)
      redirect_to game_path
    end
  end
  
  
  private
  
  def game_params
    params.require(:game).permit(:id, :white_player_id, :black_player_id )
  end


 

end
  
  
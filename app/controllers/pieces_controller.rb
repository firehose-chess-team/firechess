class PiecesController < ApplicationController

  def show
    @select_piece = Piece.find(params[:id])
    @game = @select_piece.game
  end

  def update
    select_piece = Piece.find(params[:id])
    select_piece.move_to!(params[:piece][:position_x].to_i, params[:piece][:position_y].to_i)
    redirect_to game_path(select_piece.game)
  end



  private

  def piece_params
    params.require(:piece).permit(:id, :game_id, :player_id, :type, :position_x, :position_y, :piece_color)
  end


end

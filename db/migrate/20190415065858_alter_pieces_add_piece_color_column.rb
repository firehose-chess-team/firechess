class AlterPiecesAddPieceColorColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :piece_color, :string
    add_index :pieces, :piece_color
  end
end

class AlterPiecesAddTypeIdColumnAddGameIdColumnAddPlayerIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :player_id, :integer
    add_index :pieces, :player_id
    add_column :pieces, :game_id, :integer
    add_index :pieces, :game_id
    add_column :pieces, :type, :string
    add_index :pieces, :type
  end
end

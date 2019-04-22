class AlterPiecesAddPositionXColumnAddPositionYColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :position_x, :integer
    add_index :pieces, :position_x
    add_column :pieces, :position_y, :integer
    add_index :pieces, :position_y    
  end
end

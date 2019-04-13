class AlterPiecesAddTypeColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :type, :string
    add_index :pieces, :type
  end
end

class AddBoardIdToBranches < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :board_id, :integer, allow_null: false
  end
end

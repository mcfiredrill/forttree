class AddBoardIdToBranches < ActiveRecord::Migration[4.2]
  def change
    add_column :branches, :board_id, :integer, allow_null: false
  end
end

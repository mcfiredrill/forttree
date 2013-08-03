class AddBoardIdToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :board_id, :integer, allow_null: false
  end
end

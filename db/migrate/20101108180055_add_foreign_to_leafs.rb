class AddForeignToLeafs < ActiveRecord::Migration
  def self.up
    add_column :leafs, :branch_id, :integer
  end

  def self.down
    remove_column :leafs, :branch_id
  end
end

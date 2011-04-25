class CreateBranches < ActiveRecord::Migration
  def self.up
    create_table :branches do |t|
      t.datetime :last_post_at

      t.timestamps
    end
  end

  def self.down
    drop_table :branches
  end
end

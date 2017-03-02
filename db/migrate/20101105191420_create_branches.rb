class CreateBranches < ActiveRecord::Migration[4.2]
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

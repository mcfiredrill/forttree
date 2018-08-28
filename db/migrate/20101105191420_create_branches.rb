class CreateBranches < ActiveRecord::Migration[5.0]
  def self.up
    create_table :branches do |t|
      t.datetime :last_post_at

      t.timestamps null: true
    end
  end

  def self.down
    drop_table :branches
  end
end

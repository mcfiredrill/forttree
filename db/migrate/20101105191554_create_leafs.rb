class CreateLeafs < ActiveRecord::Migration[4.2]
  def self.up
    create_table :leafs do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :leafs
  end
end

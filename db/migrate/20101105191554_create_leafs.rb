class CreateLeafs < ActiveRecord::Migration[5.0]
  def self.up
    create_table :leafs do |t|
      t.string :name
      t.text :content

      t.timestamps null: true
    end
  end

  def self.down
    drop_table :leafs
  end
end

class CreateAdmins < ActiveRecord::Migration[5.0]
  def self.up
    create_table :admins do |t|
      t.string :password_hash
      t.string :password_salt

      t.timestamps null: true
    end
  end

  def self.down
    drop_table :admins
  end
end

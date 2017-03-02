class CreateAdmins < ActiveRecord::Migration[4.2]
  def self.up
    create_table :admins do |t|
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end

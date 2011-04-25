require 'fortconfig'

class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
    Admin.create :password => ADMIN_PASS
  end

  def self.down
    drop_table :admins
  end
end

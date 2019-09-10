class AddAttachmentPhotoToLeaf < ActiveRecord::Migration[5.0]
  def self.up
    add_column :leafs, :photo_file_name, :string
    add_column :leafs, :photo_content_type, :string
    add_column :leafs, :photo_file_size, :integer
    add_column :leafs, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :leafs, :photo_file_size
    remove_column :leafs, :photo_content_type
    remove_column :leafs, :photo_file_name
    remove_column :leafs, :photo_updated_at
  end
end

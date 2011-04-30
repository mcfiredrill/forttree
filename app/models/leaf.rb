class Leaf < ActiveRecord::Base
  belongs_to :branch

  has_attached_file :photo,
      :styles => { :thumb => "300x300>" },
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => S3_KEY,
        :secret_access_key => S3_SECRET
      },
      :bucket => S3_BUCKET,
      :path => "/:style/:filename"

  validate :validates_photo_or_post

  def validates_photo_or_post
    errors.add(:leaf, "must have text or a picture, why would you want to make a
      blank post? ;3") if
      content.blank? && photo_file_name.blank?
  end
end

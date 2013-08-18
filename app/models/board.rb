class Board < ActiveRecord::Base
  has_many :branches
  has_attached_file :banner,
      :storage => STORAGE,
      :path => PHOTO_PATH,
      :s3_credentials => {
        :access_key_id => S3_KEY,
        :secret_access_key => S3_SECRET
      },
      :bucket => S3_BUCKET
end

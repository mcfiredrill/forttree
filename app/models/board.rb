class Board < ActiveRecord::Base
  has_many :branches
  has_attached_file :banner,
      :storage => STORAGE,
      :path => PHOTO_PATH,
      :s3_credentials => {
        :access_key_id => S3_KEY,
        :secret_access_key => S3_SECRET,
        :s3_region => S3_REGION
      },
      :bucket => S3_BUCKET
  default_scope -> { order('name ASC') }
  validates_attachment_content_type :banner, :content_type => VALID_ATTACHMENT_TYPES, :if => Proc.new { |p| p.errors.blank? }
  validates_attachment_size :banner, :less_than => MAX_UPLOAD_SIZE, :message => "File too big! :{", :if => Proc.new { |p| p.errors.blank? }
end

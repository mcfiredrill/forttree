class Leaf < ActiveRecord::Base
  belongs_to :branch

  #attr_accessible :content

  has_attached_file :photo,
      :styles => { :thumb => "300x300>" },
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      },
      :bucket => ENV['S3_BUCKET'],
      :path => "/:style/:filename"

  validates(:content, :presence => true)

end

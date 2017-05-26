class Leaf < ActiveRecord::Base
  belongs_to :branch, :touch => true

  has_attached_file :photo,
      :styles => { :thumb => "300x300>" },
      :storage => STORAGE,
      :path => PHOTO_PATH,
      :s3_credentials => {
        :access_key_id => S3_KEY,
        :secret_access_key => S3_SECRET,
        :s3_region => S3_REGION
      },
      :bucket => S3_BUCKET

  validate :validates_photo_or_post
  validates_attachment_content_type :photo, :content_type => VALID_ATTACHMENT_TYPES, :if => Proc.new { |p| p.errors.blank? }
  validates_attachment_size :photo, :less_than => MAX_UPLOAD_SIZE, :message => "File too big! :{", :if => Proc.new { |p| p.errors.blank? }
  validates_presence_of :branch_id

  before_post_process :transliterate_file_name

  def validates_photo_or_post
    if content.blank? && photo_file_name.blank?
      errors.add(:leaf, "must have text or a picture, why would you want to make a
        blank post? ;3")
    end
  end

  def board_name
    branch.board.name
  end

  def board_id
    branch.board.id
  end

  def board
    branch.board
  end

  def self.latest
    limit(32).order("updated_at DESC")
  end

  #XXX totally yoinked from bigchan
  private
  def transliterate_file_name
    extension = File.extname(photo_file_name).gsub(/^\.+/, '')
    filename = photo_file_name.gsub(/\.#{extension}$/, '')

    # Prepend timestamp for a unique filename
    time = Time.now.strftime("%d-%m-%Y_%H-%M-%S_").to_s

    self.photo.instance_write(:file_name, "#{time}#{transliterate(filename)}.#{transliterate(extension)}")
  end

  def transliterate(str)
    # Based on permalink_fu by Rick Olsen

    s = str.encode("UTF-8")
    # Downcase string
    s.downcase!
    # Remove apostrophes so isn't changes to isnt
    s.gsub!(/'/, '')
    # Replace any non-letter or non-number character with a space
    s.gsub!(/[^A-Za-z0-9]+/, ' ')
    # Remove spaces from beginning and end of string
    s.strip!
    # Replace groups of spaces with single hyphen
    s.gsub!(/\ +/, '-')

    return s
  end
end

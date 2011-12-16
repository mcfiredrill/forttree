BOARDTITLE = 'FortTree'
BRANCHES_PER_PAGE = 10
SHOWTITLETXT=true
SMILEY_ASSIST=true
MAX_UPLOAD_SIZE = 5.megabytes
VALID_ATTACHMENT_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/pjpeg', 'image/tiff', 'image/x-png', 'image/bmp', 'image/svg+xml']
STORAGE = :filesystem
PHOTO_PATH = ':rails_root/public:url'

# okay tony if you don't use environment variables this won't affect you
# anymore
S3_BUCKET = ENV['S3_BUCKET']
S3_KEY = ENV['S3_KEY']
S3_SECRET = ENV['S3_SECRET']
ENV['STORAGE'] and STORAGE = ENV['STORAGE']
ENV['PHOTO_PATH'] and PHOTO_PATH = ENV['PHOTO_PATH']

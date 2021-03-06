BOARDTITLE = 'FortTree'
BRANCHES_PER_PAGE = 10
SHOWTITLETXT=true
SMILEY_ASSIST=true
MAX_UPLOAD_SIZE = 5.megabytes
VALID_ATTACHMENT_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/pjpeg', 'image/tiff', 'image/x-png', 'image/bmp', 'image/svg+xml']
STORAGE = ENV['STORAGE'] || :filesystem # valid options are :filesystem, :s3
S3_BUCKET = ENV['S3_BUCKET']
S3_KEY = ENV['S3_KEY']
S3_SECRET = ENV['S3_SECRET']
S3_REGION = ENV['S3_REGION']
PHOTO_PATH = ':rails_root/public:url'
DEFAULT_BOARD = ENV['DEFAULT_BOARD']

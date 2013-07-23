# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if ENV['RAILS_ENV'] == 'production'
  Forttree::Application.config.secret_token = ENV['SECRET_TOKEN']
  Forttree::Application.config.secret_key_base = ENV['SECRET_KEY_BASE']
else
  Forttree::Application.config.secret_token = '9f642a303ffebfe934c9534af35af22e9c704484a2d33aec7b8cb07e4f88ce1f8f9c7fc46d03413f2ab002e06c85d0497f450d0587276117a1ef5555e167be45'
  Forttree::Application.config.secret_key_base = '9f642a303ffebfe934c9534af35af22e9c704484a2d33aec7b8cb07e4f88ce1f8f9c7fc46d03413f2ab002e06c85d0497f450d0587276117a1ef5555e167be45'
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require './test/factories'
require 'fortconfig_defaults.rb' #test with default configuration

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

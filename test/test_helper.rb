require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
# require 'minitest/focus'

class ActiveSupport::TestCase
  include ActiveJob::TestHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # This allows us to use the sign_in and sign_out
  include Warden::Test::Helpers
  include Devise::Test::IntegrationHelpers
end

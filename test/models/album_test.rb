
require 'test_helper'
 
class AlbumTest < ActiveSupport::TestCase
 test "index action should work" do
  get :index
  assert_response :success
end
end
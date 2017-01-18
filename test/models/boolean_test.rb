
require 'test_helper'
 
class BooleanTest < ActiveSupport::TestCase
 test "should not save album without title" do
  album = Album.new
  assert_not album.save, "Saved album without a title"
end
end
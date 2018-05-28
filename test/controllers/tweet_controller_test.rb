require 'test_helper'

class TweetControllerTest < ActionDispatch::IntegrationTest
  test "should get timeline" do
    get tweet_timeline_url
    assert_response :success
  end

end

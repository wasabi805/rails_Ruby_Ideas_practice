require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get likes_new_url
    assert_response :success
  end

  test "should get create" do
    get likes_create_url
    assert_response :success
  end

  test "should get show" do
    get likes_show_url
    assert_response :success
  end

end

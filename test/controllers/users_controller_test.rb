require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "get the bloggers page" do
    get users_url
    assert_response :success
  end

  test "sign up page" do
    get signup_url
    assert_response :success
  end
end

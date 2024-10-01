require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should create user" do
    post users_path, params: { user: { name: "Test User", email: "test@example.com", encrypted_password: "password" } }
    assert_response :redirect  # 成功した場合はリダイレクトされるため
  end
end

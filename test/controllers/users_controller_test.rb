require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url # new_users_urlからnew_user_urlに変更
    assert_response :success
  end

  test "should create user" do
    post users_path, params: { user: { name: "Test User", email: "test@example.com", 
    password: "password", password_confirmation: "password" } }
    assert_response :redirect  # 成功した場合はリダイレクトされるため
  end
end

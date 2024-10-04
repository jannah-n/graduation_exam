require "test_helper"

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # テスト用のユーザーを作成
    @user = users(:one) # fixturesからユーザーを取得
    post sessions_create_url, params: { email: @user.email, password: "password" }
  end

  test "should get index" do
    get quizzes_path
    assert_response :success
  end
end

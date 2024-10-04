require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    # テスト用のユーザーをセットアップ
    @user = users(:one) # fixturesから取得
  end

  test "should get new" do
    get login_url  # sessions_new_urlからnew_session_urlに変更
    assert_response :success
  end

  test "should create session" do
    post sessions_create_url, params: { email: "test@example.com", password: "password" }
    assert_redirected_to quizzes_path  # クイズ開始画面に遷移することを確認
  end

  test "should get destroy" do
    delete logout_url  # 正しいURLヘルパーを使用
    assert_redirected_to root_url  # 成功時の遷移先を確認
  end
end

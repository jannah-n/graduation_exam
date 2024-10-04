class QuizzesController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end
end

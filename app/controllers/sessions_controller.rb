class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "ログインしました"
      redirect_to quizzes_path # クイズ開始画面にリダイレクト
    else
      flash[:danger] = "ログインできませんでした"
      render :new # ログイン画面を再表示
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to root_path # トップ画面にリダイレクト
  end
end

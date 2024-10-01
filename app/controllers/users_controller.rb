class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録できました"
      redirect_to root_path
    else
      flash.now[:danger] = "ユーザー登録できませんでした"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password)
  end
end

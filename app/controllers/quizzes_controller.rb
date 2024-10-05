class QuizzesController < ApplicationController
  before_action :require_login
  before_action :set_questions, only: [:index, :show, :answer]

  def index
    session[:current_question] = 0  # 現在の質問インデックスを初期化
    redirect_to quiz_path(session[:quiz_questions][session[:current_question]])  # 最初の質問へリダイレクト
  end

  def show
    @question = Question.find(session[:quiz_questions][session[:current_question]])
    @user = current_user  # 現在のユーザーを取得
  end

  def answer
    user_answer = params[:choice]
    question = Question.find(session[:quiz_questions][session[:current_question]])
    
    if user_answer == question.correct_choice
      flash[:notice] = "正解しました!!"
      session[:current_question] += 1
      if session[:current_question] < session[:quiz_questions].length
        redirect_to quiz_path(session[:quiz_questions][session[:current_question]])  # 次の質問へリダイレクト
      else
        redirect_to quiz_complete_path  # クイズ終了ページへリダイレクト
      end
    else
      flash.now[:alert] = "不正解です(T_T)"
      render :show  # 同じ質問を表示
    end
  end

  def complete
    @user = current_user  # 現在のユーザーを取得
  end

  private

  def require_login
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end

  def set_questions
    session[:quiz_questions] ||= Question.all.sample(10).map(&:id)  # ランダムに10問取得してセッションに保存
  end
end

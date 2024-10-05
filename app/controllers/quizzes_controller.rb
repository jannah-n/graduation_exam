class QuizzesController < ApplicationController
  before_action :require_login

  def index
    @questions_available = Question.count > 0  # 質問があるか確認
  end

  def start
    questions = Question.all.sample(10).map(&:id)  # ランダムに10問取得

    if questions.present?
      session[:quiz_questions] = questions
      session[:current_question] = 0  # 現在の質問インデックスを初期化
      redirect_to quiz_path(questions.first)  # 最初の質問へリダイレクト
    else
      flash[:alert] = "質問がありません。"  # 質問がない場合のメッセージ
      redirect_to quizzes_path  # index へ戻る
    end
  end

  def show
    @question = Question.find(session[:quiz_questions][session[:current_question]])
    @user = current_user  # 現在のユーザーを取得
  end

  def answer
    user_answer = params[:choice]
    question = Question.find(session[:quiz_questions][session[:current_question]])

    if user_answer == question.correct_choice
      flash[:success] = "正解しました!!"
      session[:current_question] += 1
      if session[:current_question] < session[:quiz_questions].length
        redirect_to quiz_path(session[:quiz_questions][session[:current_question]])  # 次の質問へリダイレクト
      else
        redirect_to quiz_complete_path  # クイズ終了ページへリダイレクト
      end
    else
      flash.now[:danger] = "不正解です(T_T)"
      @question = question  # ここで不正解の質問を再設定
      render :show, status: :unprocessable_entity  # 同じ質問を表示
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
end

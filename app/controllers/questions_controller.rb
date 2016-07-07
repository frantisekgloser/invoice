class QuestionsController < ApplicationController
  before_action :require_admin!, only: :index

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to new_question_path, notice: 'Question was created successfully.'
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def require_admin!
    is_admin = current_user && current_user.admin?
    redirect_to new_user_session_path unless is_admin
  end
end

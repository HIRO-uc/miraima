class QuestionsController < ApplicationController
  before_action :current_path_question, only: [:edit, :update, :show, :destroy]

  def index
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @questions = Question.includes(:user).order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end

  def edit
  end

  def update
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  def show
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:text, :title).merge(user_id: current_user.id)
  end

  def current_path_question
    @question = Question.find(params[:id])
  end
end

class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_path_question, only: [:edit, :update, :show, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
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

  def move_to_index
    unless @question.user_id == current_user.id
      redirect_to root_path
    end
  end
end
class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_path_question, only: [:edit, :update, :show, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def show
    @answers = @question.answers.includes(:user).order(created_at: :desc)
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:text, :title, :type_id).merge(user_id: current_user.id)
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

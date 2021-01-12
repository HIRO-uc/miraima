class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_path_question, only: [:new, :create, :edit, :update, :destroy, :move_to_question_show, :move_to_index]
  before_action :current_path_answer, only: [:edit, :update, :destroy, :move_to_question_show]
  before_action :move_to_question_show, only: [:edit, :update, :destroy]
  before_action :move_to_index

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:text).merge(question_id: params[:question_id], user_id: current_user.id)
  end

  def current_path_question
    @question = Question.find(params[:question_id])
  end

  def current_path_answer
    @answer = Answer.find(params[:id])
  end

  def move_to_question_show
    if (@answer.user_id != current_user.id)
      redirect_to question_path(@question)
    end
  end

  def move_to_index
    if (@question.user_id == current_user.id) || (@question.type_id != 0 && (@question.type_id != current_user.id))
      redirect_to questions_path
    end
  end
end

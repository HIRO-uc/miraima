class CareersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_path_user, only: [:new, :create, :edit, :update, :move_to_index]
  before_action :current_path_career, only: [:edit, :update]
  before_action :move_to_index, only: [:new, :create, :edit, :update]

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(career_params)
    if @career.save
      redirect_to user_path(@career.user_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @career.update(career_params)
      redirect_to user_path(@career.user_id)
    else
      render :edit
    end
  end

  private
  def career_params
    params.require(:career).permit(:worthwhile, :ideal_candidate, :can_do_now, :recommended_book).merge(user_id: params[:user_id])
  end

  def current_path_user
    @user = User.find(params[:user_id])
  end

  def current_path_career
    @career = Career.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @user.id
      redirect_to root_path
    end 
  end
end

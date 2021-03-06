class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_path_user, only: [:new, :create, :edit, :update, :move_to_index]
  before_action :current_path_profile, only: [:edit, :update]
  before_action :move_to_index, only: [:new, :create, :edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(@profile.user_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(@profile.user_id)
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:self_introduction, :website).merge(user_id: params[:user_id])
  end

  def current_path_user
    @user = User.find(params[:user_id])
  end

  def current_path_profile
    @profile = Profile.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @user.id
      redirect_to root_path
    end 
  end
end

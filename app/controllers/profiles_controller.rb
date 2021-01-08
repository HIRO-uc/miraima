class ProfilesController < ApplicationController
  before_action :current_path_profile, only: [:edit, :update]
  before_action :move_to_index

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to user_path(@profile.user_id)
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to user_path(@profile.user_id)
  end

  private
  def profile_params
    params.require(:profile).permit(:self_introduction, :website).merge(user_id: params[:user_id])
  end

  def current_path_profile
    @profile = Profile.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && (params[:user_id] == current_user.id)
      redirect_to root_path
    end
  end
end

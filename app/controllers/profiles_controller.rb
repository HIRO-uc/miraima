class ProfilesController < ApplicationController
  before_action :current_path_profile, only: [:edit, :update]

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
    params.require(:profile).permit(:profile, :website).merge(user_id: params[:user_id])
  end

  def current_path_profile
    @profile = Profile.find(params[:id])
  end
end

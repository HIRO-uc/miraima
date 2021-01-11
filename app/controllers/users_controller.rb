class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_path_user, only: [:show, :move_to_index]
  before_action :move_to_index

  def show
  end

  private
  def move_to_index
    unless current_user.id == @user.id
     redirect_to root_path
    end 
  end

  def current_path_user
    @user = User.find(params[:id])
  end
end

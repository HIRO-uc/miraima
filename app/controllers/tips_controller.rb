class TipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_path_tip, only: [:show, :destroy, :move_to_index]
  before_action :move_to_index, only: [:destroy]

  def index
    @tips = Tip.includes(:user).order(created_at: :desc)
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    @tip.save
    redirect_to root_path
  end

  def show
  end

  def destroy
    @tip.destroy
    redirect_to root_path
  end

  private
  def tip_params
    params.require(:tip).permit(:text).merge(user_id: current_user.id)
  end

  def current_path_tip
    @tip = Tip.find(params[:id])
  end

  def move_to_index
    unless @tip.user_id == current_user.id
      redirect_to root_path
    end
  end
end

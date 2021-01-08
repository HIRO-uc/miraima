class TipsController < ApplicationController
  def index
    if user_signed_in?
      @user = User.find(current_user.id)
      @profiles = Profile.new
    end
  end
end

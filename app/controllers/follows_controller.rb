class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follows.create(followed_user: @user)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    current_user.follows.find_by(followed_user: @user).destroy
    redirect_to @user
  end
end

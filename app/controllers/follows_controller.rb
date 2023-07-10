class FollowsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    current_user.followeds << @user
    redirect_to @user
  end

  def destroy
    @follow = Fololow.find(params[:id])
    @user = @follow.followed
    @follow.destroy
    redirect_to @user
  end
end

class FollowRelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[@user])
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[@user])
    redirect_to user_path(@user)
  end
end

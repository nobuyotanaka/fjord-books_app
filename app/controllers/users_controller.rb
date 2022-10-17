# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @follow_relationship = FollowRelationship.find_by(following: current_user, follower: @user)
  end

  def followings
    # userがフォローしている人達
    @followings = @user.followings.with_attached_avatar
  end

  def followers
    # userをフォローしている人達
    @followers = @user.followers.with_attached_avatar
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

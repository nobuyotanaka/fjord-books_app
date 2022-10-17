# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(params[:user_id])
    redirect_to user_path(@user)
  end

  def destroy
    follow_relationship = current_user.following_relationships.find_by(id: params[:id])
    follow_relationship.destroy if follow_relationship
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

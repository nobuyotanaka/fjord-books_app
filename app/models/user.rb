# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

#-----------------
#　relations
#-----------------

  has_many :following_relationships, class_name: 'FollowRelationship', foreign_key: 'following_id', dependent: :destroy
  has_many :follower_relationships, class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy

  has_many :followers, through: :following_relationships, source: :follower
  has_many :followings, through: :follower_relationships, source: :following

#-----------------
#　method
#-----------------
  
  # フォローしたときの処理
  def follow(user_id)
    follower_relationships.create!(following_id: user_id)
  end

  # フォローしているか否かを確認
  def following?(user)
    followings.include?(user)
  end

  # フォローをやめるときの処理
  def unfollow(user_id)
    follower_relationships.find_by(following_id: user_id).destroy
  end

end

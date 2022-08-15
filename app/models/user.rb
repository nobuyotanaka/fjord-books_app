# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

#-----------------
#　relations
#-----------------

  has_many :following_relationship, class_name: 'FollowRelationship', foreign_key: 'following_id', dependent: :destroy
  has_many :follower_relationship, class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy

  has_many :followings, through: :following_relationship, source: :follower
  has_many :followers, through: :follower_relationship, source: :following
end

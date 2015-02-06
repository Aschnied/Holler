class User < ActiveRecord::Base
  has_many :tweets
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followed_id
end

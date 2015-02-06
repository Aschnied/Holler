class User < ActiveRecord::Base
  has_many :hollers
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followed_id

  # validates :user_handle, :full_name, :email, :password, presence: true
end

class User < ActiveRecord::Base
  has_many :hollers
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followed_id

  validates :user_handle, :full_name, :email, :password, presence: true
  validates :email, :user_handle, uniqueness: true
  validates :password, length: {
    minimum: 8, maximum: 20}
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end

class Follow < ActiveRecord::Base
  belongs_to :user

  validates :follower_id, :followed_id, presence: true
end

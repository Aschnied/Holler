class Holler < ActiveRecord::Base

  belongs_to :user

  validates :content, length: {
    minimum: 1, maximum: 140}

  before_save :original
  def original
      self.original_author ||= User.find(self.user_id).user_handle
  end
end


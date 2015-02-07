  `````````````````````````````````````````````````````   1````````````` 1class Holler < ActiveRecord::Base

  belongs_to :user

  before_save :original

  def original
      self.original_author ||= User.find(self.user_id).user_handle
  end
end


class Comment < ActiveRecord::Base

  validates :artwork_id, presence: true
  validates :comment, presence: true, allow_blank: false, allow_nil: false
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :artwork

end

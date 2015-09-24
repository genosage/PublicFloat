class User < ActiveRecord::Base
  validates :user_email, presence: true, allow_nil: false, allow_blank: false, uniqueness: true
  has_many :comments
end

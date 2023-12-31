class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed_user, class_name: 'User'
  validates :follower_id, uniqueness: { scope: :followed_user_id }
end
    
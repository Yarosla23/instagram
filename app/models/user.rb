class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follows, foreign_key: :follower_id, dependent: :destroy, class_name: 'Follow'
  has_many :followed_users, through: :follows
  
 
  has_many :posts

  has_many :comments
  has_many :likes

end

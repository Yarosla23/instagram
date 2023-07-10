class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :followed_follows, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :followed_follows, source: :follower

  has_many :followed_follows, class_name: "Follow", foreign_key: "follower_id"
  has_many :followeds, through: :followed_follows, source: :followed
  has_many :posts

  has_many :comments
  has_many :likes

end

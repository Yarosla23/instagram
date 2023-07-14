class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

    has_many :follows, 
              foreign_key: :follower_id,
              dependent: :destroy, 
              class_name: 'Follow'
    has_many :followed_users, through: :follows, dependent: :destroy

    has_many :following_users,
            foreign_key: :followed_user_id, 
            class_name: 'Follow',
            dependent: :destroy

    has_many :followers, through: :following_users, dependent: :destroy

           
  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

end

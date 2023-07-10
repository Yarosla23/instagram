class Post < ApplicationRecord
    
    validates :title, presence: true, length: {minimum: 3,  maximum: 100}
    validates :description, presence: true, length: {minimum: 5,  maximum: 1000}
    validates :tags, presence: true, length: {minimum: 2,  maximum: 100}

    mount_uploader :picture, PictureUploader

    belongs_to :user

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

   
end

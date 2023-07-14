class Comment < ApplicationRecord
    belongs_to :post
    validates :text, presence: true, length: {minimum: 3,  maximum: 1000}
end

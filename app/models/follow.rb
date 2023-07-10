class Follow < ApplicationRecord

    # The user giving the follow

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end

FactoryBot.define do
    factory :follow do
      association :follower, factory: :user
      association :followed_user, factory: :user
    end
  end
FactoryBot.define do
  factory :comment do
    association :post
    text { Faker::Lorem.sentence(word_count: 10) } 
  end
end
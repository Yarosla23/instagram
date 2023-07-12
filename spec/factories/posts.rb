FactoryBot.define do
    factory :post do
      title { "заголовок" }
      description { "описание" }
      tags { "тег" }
      association :user
    end
  end
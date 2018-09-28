FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    body  {  Faker::Lorem.sentence  }
  end
end
FactoryBot.define do
  factory :product do
    title { "MyString" }
    image { "MyString" }
    url { "MyString" }
    description { "MyText" }
    user { nil }
  end
end

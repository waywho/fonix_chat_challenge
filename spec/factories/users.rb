FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "MyString#{n}@test.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
end

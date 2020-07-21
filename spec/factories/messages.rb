FactoryBot.define do
  factory :message do
    chatroom { nil }
    user { nil }
    content { "MyText" }
  end
end

FactoryBot.define do
  factory :message do
    chatroom
    user
    content { "MyText" }
  end
end

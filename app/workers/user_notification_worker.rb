class UserNotificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :mailers, retry: 3

  def perform(user, chatroom)
    ::UserMailer.chat_message_stats(user, chatroom).deliver_later
  end
end

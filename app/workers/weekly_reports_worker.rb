class WeeklyReportsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :mailers, retry: 3

  def perform(user)
  	chatroom = Chatroom.find_by_nmae("General")
    ::UserMailer.chat_message_stats(user, chatroom).deliver_later
  end
end

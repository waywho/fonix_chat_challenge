class WeeklyReportsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 3

  def perform
  	chatroom = Chatroom.find_by_name("General")
    User.all.each do |user|
    	UserNotificationWorker.perform_async(user, chatroom)
    end
  end
end

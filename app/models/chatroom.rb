class Chatroom < ApplicationRecord
	has_many :chatroom_users, dependent: :destroy
	has_many :users, through: :chatroom_users
	has_many :messages, dependent: :destroy

	validates :name, presence: true

	def last_week_message_count
		messages.where('created_at >= ?', 1.week.ago).length
	end
end

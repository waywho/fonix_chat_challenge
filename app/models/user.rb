class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :chatroom_users, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true,  uniqueness: true

  after_create :join_general_chat

  def last_message_sent_date
     messages.sort_by(&:created_at).last.created_at
  end

  def recieved_count_since_last_sent
    # assuming only one chatroom so all messages are counted as received by User
    Message.where('created_at >= ?', last_message_sent_date).length
  end

  private

	def join_general_chat
		chatroom = Chatroom.find_by_name("General")
		ChatroomUser.create(user: self, chatroom: chatroom)
	end
end

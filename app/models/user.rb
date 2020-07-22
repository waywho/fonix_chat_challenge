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

  private

	def join_general_chat
		chatroom = Chatroom.find_by_name("General")
		ChatroomUser.create(user: self, chatroom: chatroom)
	end
end

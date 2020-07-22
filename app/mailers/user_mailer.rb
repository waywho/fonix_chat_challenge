class UserMailer < ApplicationMailer
	default from: "info@fonixchat.test"

	def chat_message_stats(user, chatroom)
		@user = user
		@chatroom = chatroom

		mail to: @user.email, subject: "[Fonix Chat] Your weekly chat stats"
	end
end

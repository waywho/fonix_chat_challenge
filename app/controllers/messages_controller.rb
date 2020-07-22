class MessagesController < ApplicationController
	before_action :authenticate_user!

	def create
		message = current_user.messages.new(message_params)
		if message.save
			MessageRelayJob.perform_later(message)
			respond_to do |format|
    		format.js { render 'chatrooms/sent_message' }
			end
		else
		end
	end


	private

	def message_params
     params.require(:message).permit(:content, :chatroom_id)
 	end
end

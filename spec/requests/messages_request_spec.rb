require 'rails_helper'

RSpec.describe "Messages", type: :request do
	let(:valid_attributes) {
    # FactoryBot.build(:message).attributes
    {
    	content: "My Text",
    	chatroom_id: FactoryBot.create(:chatroom).id
    }
  }

  let(:invalid_attributes) {
    { content: nil }
  }

  before(:each) do
  	@user = FactoryBot.create(:user)
  	sign_in @user
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a message" do
        expect {
          post messages_url, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new message" do
        expect {
          post messages_url, params: { message: invalid_attributes }
        }.to change(Message, :count).by(0)
      end
    end
  end

end

require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Associations' do
		 it { should have_many(:messages) }
		 it { should have_many(:chatroom_users) }
		 it { should have_many(:chatrooms) }
	end

	describe 'Validations' do
		it { should validate_presence_of(:name) }
		it { should validate_uniqueness_of(:name) }
	end

	describe 'After create account' do
		it "should auto added to General chat" do
			chatroom = FactoryBot.create(:chatroom, name: "General")
			user = FactoryBot.create(:user)
			user.reload
			expect(user.chatrooms.map(&:name)).to include("General")
		end
	end
end

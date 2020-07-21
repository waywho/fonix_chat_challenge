require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Associations' do
		 it { should have_many(:messages) }
		 it { should have_many(:chatroom_users) }
		 it { should have_many(:chatrooms) }
	end
end

require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  describe "Associations" do
  	it { should have_many(:messages) }
  	it { should have_many(:chatroom_users) }
  	it { should have_many(:users) }
  end
end

require 'rails_helper'

RSpec.describe MessageRelayJob, type: :job do
  describe "#perform_later" do
    it "send a message" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        MessageRelayJob.perform_later('message')
      }.to have_enqueued_job
    end
  end
end

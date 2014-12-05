require 'rails_helper'

RSpec.describe Rsvp, :type => :model do
  context "validation" do
    subject{ build(:rsvp) }
    it{ should be_valid }
    it "should require a user" do
      expect( build(:rsvp, user: nil) ).not_to be_valid
    end
    it "should require an event" do
      expect( build(:rsvp, event: nil) ).not_to be_valid      
    end
    it "should require the event to be in the future" do
      e = create(:event, starts_at: 2.weeks.ago)
      expect( build(:rsvp, event: e)).not_to be_valid
    end
  end
end

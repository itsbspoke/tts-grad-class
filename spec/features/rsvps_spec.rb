require 'rails_helper'

RSpec.describe "Rsvps", :type => :request do
  let(:event){ create(:event) }
  let(:user){ create(:user) }
  
  describe "for an event" do
    before(:each) do
      login(user)
      visit_event(event)    
    end
    
    it "shows the rsvp form" do
      expect(page).to have_selector("form#new_rsvp")
    end
    it "should accept an RSVP" do
      expect{
        within("form#new_rsvp") do
          click_button "RSVP"
        end
        expect(page).to have_content("1 RSVP")
      }.to change(Rsvp, :count).by(1)
    end
  end
  
  describe "for a paid group event" do
    before(:each) do
      @group = create(:paid_group)
      @event = create(:event, group: @group)     
    end
    context "without a membership" do
      before(:each) do
        login(user)
        visit_event(@event)
      end
      it "does not show the rsvp form" do
        expect(page).not_to have_selector("form#new_rsvp")
      end
      it "does show the join form" do
        expect(page).to have_selector("form#new_membership")
      end
    end
    context "with a membership" do
      before(:each) do
        create(:membership, user: user, group: @group, active_until: 3.weeks.from_now)
        login(user)
        visit_event(@event)       
      end
      it "does show the rsvp form" do
        expect(page).to have_selector("form#new_rsvp")
      end
      it "does not show the join form" do
        expect(page).not_to have_selector("form#new_membership")
      end
    end    
  end  
end

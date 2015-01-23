require 'rails_helper'

RSpec.describe MembershipPlan, :type => :model do
  context "validity" do
    subject{ build(:membership_plan) }
    it "should require a group" do
      expect( build(:membership_plan, group: nil) ).not_to be_valid
    end
    it "should require an amount" do
      expect( build(:membership_plan, amount: nil) ).not_to be_valid      
    end
    it "should require a stripe ID" do
      expect( build(:membership_plan, stripe_id: nil) ).not_to be_valid      
    end
    it "should require a name" do
      expect( build(:membership_plan, name: nil) ).not_to be_valid      
    end
  end
end

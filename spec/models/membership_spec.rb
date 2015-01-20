require 'rails_helper'

RSpec.describe Membership, :type => :model do
  describe "validation" do
    subject{ build(:membership) }
    it{ should be_valid }
    it "should require a user" do
      expect( build(:membership, user: nil) ).not_to be_valid
    end
    it "should require a group" do
      expect( build(:membership, group: nil) ).not_to be_valid
    end
  end
end

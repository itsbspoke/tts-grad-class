require 'rails_helper'

RSpec.describe Group, :type => :model do
  describe "validation" do
    subject{ build(:group) }
    it{should be_valid}
    it "should require a name" do
      expect( build(:group, name: nil) ).not_to be_valid
    end
    it "should require an owner" do
      expect( build(:group, owner: nil) ).not_to be_valid
    end    
  end
end

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
  describe "unique slug" do
    it "should generate a slug when saved" do
      group = create(:group)
      expect( group.slug ).not_to be_nil
    end
    it "should prevent slug conflict" do
      group = create(:group)
      group_two = create(:group)
      expect( group_two.slug ).not_to be_nil
      expect( group_two.slug ).not_to eq(group.slug)
    end
  end
  
  
end

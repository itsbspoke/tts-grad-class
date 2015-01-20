require 'rails_helper'

RSpec.describe User, :type => :model do
  context "validation" do
    subject{ build(:user) }
    it{ should be_valid }
    it "should expose an admin" do
      expect(build(:admin)).to have_role("admin")
    end
  end
end

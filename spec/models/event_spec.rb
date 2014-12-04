require 'rails_helper'

RSpec.describe Event, :type => :model do
  context "validation" do
    subject { build(:event) }
    it{ should be_valid }
    it "should require a creator" do
      expect(build(:event, user_id: nil)).not_to be_valid
    end
    it "should require a title" do
      expect(build(:event, title: nil)).not_to be_valid      
    end
    it "should require a description" do
      expect(build(:event, description: nil)).not_to be_valid      
    end
    pending "should require a start time" do
      expect(build(:event, starts_at: nil)).not_to be_valid      
    end
    pending "should require an end time" do
      expect(build(:event, ends_at: nil)).not_to be_valid      
    end
  end
end

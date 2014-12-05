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
  
  context "time determinations" do
    it "should identify a past event" do
      expect(build(:event, 
        starts_at: 2.weeks.from_now)).not_to be_in_past
    end
    it "should not identify a current event as being in the past" do
      expect(build(:event, 
        starts_at: 2.weeks.ago)).to be_in_past
    end
  end
end

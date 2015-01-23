require 'rails_helper'

describe "Events", :type => :feature do
  
  let(:user){ create(:user) }
  
  before(:each) do
    create(:event)
  end

  it "lets me view them" do
    visit events_path 
    expect(page).to have_content 'SierraMaya360'
  end
  
  it "lets me start to create one" do
    visit "/"
    click_link "Events"
    expect(page).to have_link 'New Event'
  end
  
  it "let me create one" do
    login
    visit "/"
    click_link "Events"
    click_link 'New Event'
    within("#new_event") do
      fill_in "Title", with: "Introducing SierraMaya360"
      fill_in "Description", with: "Get investment readiness advice from nationally respected investors based in Charlotte."
      #select_datetime "2006-03-30 17:00", from: "Starts at"
      #select_datetime "2006-03-30 18:00", from: "Ends at"
      click_button 'Create Event'
    end
    expect(page).to have_content("Introducing")
  end

end

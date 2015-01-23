def login(user=nil)
  u = user || create(:user)
  visit new_user_session_path
  within("#new_user") do
    fill_in 'Email', :with => u.email
    fill_in 'Password', :with => '12345678'
    click_button 'Log in'
  end
end

def visit_event(event)
  click_link "Events"
  click_link event.title   
end


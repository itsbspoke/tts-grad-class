class EventMailer < ActionMailer::Base
  
  default from: 'notifications@example.com'
 
    def upcoming_email(user)
      @user = user
      @events  = user.upcoming_events
      mail(to: @user.email, subject: 'Here are your upcoming events')
    end  
end

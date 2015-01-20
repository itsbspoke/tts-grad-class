class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :user, presence: true
  validates :event, presence: true
  
  validate :only_future_events
  
  validates :guest_count, inclusion: { in: 0..9 }
  
  def only_future_events
    if event.in_past?
      errors.add(:event, "must be in the future")
    end
  end
  
end

class Event < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true  
  validates :description, presence: true    
  #validates :starts_at, presence: true
  #validates :ends_at, presence: true
  has_many :rsvps
  
  # true, false
  def in_past?
    starts_at < Time.now 
  end
  
  def rsvp_count
    rsvps.count
  end

end

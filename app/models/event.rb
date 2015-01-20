class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
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

  #validates :ends_at, presence: true
  
  def self.from_group(group)
    where(group: group)
  end
  
  def self.upcoming(reference = Time.now)
    where("starts_at > ?", reference)
  end
  
  def self.most_recent
    order('starts_at ASC, created_at ASC')
  end
end

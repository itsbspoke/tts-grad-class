class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :user, presence: true
  validates :title, presence: true  
  validates :description, presence: true    
  #validates :starts_at, presence: true
  #validates :ends_at, presence: true
end

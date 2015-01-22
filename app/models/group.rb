class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  validates :owner, presence: true
  validates :name, presence: true
  
  has_many :memberships, counter_cache: true
  has_many :events
  
  extend FriendlyId  
  friendly_id :name, use: :slugged  
end

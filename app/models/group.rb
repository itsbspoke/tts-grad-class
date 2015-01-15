class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  validates :owner, presence: true
  validates :name, presence: true
  
end

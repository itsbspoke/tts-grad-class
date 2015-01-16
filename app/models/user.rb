class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
         
         
  has_many :owned_groups, class_name: "Group"
  has_many :memberships
  has_many :groups, through: :memberships
  
  def upcoming_events
    Event.from_group(u.groups).upcoming.most_recent    
  end
end

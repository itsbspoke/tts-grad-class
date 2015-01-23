class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  validates :owner, presence: true
  validates :name, presence: true
  
  has_many :memberships, counter_cache: true
  has_many :members, through: :memberships, source: :user
  has_many :events
  
  extend FriendlyId  
  friendly_id :name, use: :slugged
  
  has_many :membership_plans
  
  before_create :ensure_paid_groups_have_a_plan
  
  def ensure_paid_groups_have_a_plan
    if !free && membership_plans.empty?
      plan = 
       MembershipPlan.new(amount: 500, 
        interval: "month", stripe_id: self.slug,
        name: "#{self.name} basic membership",
        group: self)
      self.membership_plans.append(plan)
    end
  end
  
end

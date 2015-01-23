class MembershipPlan < ActiveRecord::Base
  include Payola::Plan
  belongs_to :group
  has_many :memberships
  
  validates :group, presence: true
  validates :interval, presence: true, inclusion: { in: %w(day week month year) }
  validates :amount, presence: true
  validates :stripe_id, presence: true
  validates :name, presence: true      
  
end

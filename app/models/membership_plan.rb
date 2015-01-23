class MembershipPlan < ActiveRecord::Base
  include Payola::Plan
  belongs_to :group
  has_many :memberships
end

class AddActivityToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :active_until, :datetime
  end
end

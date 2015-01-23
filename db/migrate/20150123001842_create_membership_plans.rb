class CreateMembershipPlans < ActiveRecord::Migration
  def change
    create_table :membership_plans do |t|
      t.references :group
      t.integer :amount, null: false
      t.string :interval, null: false
      t.string :stripe_id, null: false
      t.string :name, null: false

      t.timestamps
    end
    #add_foreign_key :groups, :membership_plans
  end
end

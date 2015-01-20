class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :owner_id, null: false
      t.integer :membership_count, null: false, default: 1

      t.timestamps
    end
    add_foreign_key :groups, :users, column: :owner_id
  end
end

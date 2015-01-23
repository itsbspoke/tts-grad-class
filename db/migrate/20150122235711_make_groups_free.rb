class MakeGroupsFree < ActiveRecord::Migration
  def change
    add_column :groups, :free, :boolean, null: false, default: true
  end
end

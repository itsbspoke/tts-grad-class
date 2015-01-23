class AddSlugToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :slug, :string, null: false
    add_index :groups, :slug, unique: true
  end
end

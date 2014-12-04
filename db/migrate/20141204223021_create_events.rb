class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, nil: false
      t.string :title, nil: false
      t.text :description, nil: false
      t.datetime :starts_at, nil: false
      t.datetime :ends_at, nil: false

      t.timestamps
    end
    add_foreign_key :events, :users
  end
end

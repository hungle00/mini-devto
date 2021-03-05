class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :notification_type, null: false
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    end
    add_index :inboxes, :user_id, unique: false
    add_index :inboxes, :message_id, unique: false
  end
end

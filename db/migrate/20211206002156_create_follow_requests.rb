class CreateFollowRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_requests do |t|
      t.integer :recipient_id, null: false,foreign_key:true, index: true
      t.integer :sender_id, null: false,foreign_key:true, index: true
      t.string :status

      t.timestamps
    end
  end
end
class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :recipient_id, null: false
      t.integer :sender_id, null: false
      t.string :status

      t.timestamps
    end
  end
end
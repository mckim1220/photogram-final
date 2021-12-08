class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :fan_id, null: false,foreign_key:true, index: true
      t.integer :photo_id, null: false,foreign_key:true, index: true
      t.timestamps
    end
  end
end
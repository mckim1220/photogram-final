class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :photo, null: false

      t.timestamps
    end
  end
end
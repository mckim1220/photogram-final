class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.belongs_to :user, null: false
      t.integer :likes_count
      t.string :image
      t.integer :comments_count
      t.text :caption

      t.timestamps
    end
  end
end
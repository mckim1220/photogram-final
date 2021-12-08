class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :owner_id, null: false,foreign_key:true, index: true
      t.integer :likes_count
      t.string :image
      t.integer :comments_count
      t.text :caption
      t.timestamps
    end
  end
end
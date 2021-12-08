class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false,foreign_key:true, index: true
      t.integer :photo_id, null: false,foreign_key:true, index: true
      t.text :body
      t.timestamps
    end
  end
end
class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :photo, null: false
      t.text :body

      t.timestamps
    end
  end
end
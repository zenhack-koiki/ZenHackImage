class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :session_id
      t.string :image_id
      t.boolean :is_like

      t.timestamps null: false
    end
  end
end

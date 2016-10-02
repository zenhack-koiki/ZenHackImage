class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :state
      t.string :city
      t.string :zipcode
      t.timestamps null: false
    end
  end
end

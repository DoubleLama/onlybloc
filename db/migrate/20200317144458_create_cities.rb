class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, index: true
      t.string :zipcode, index: true
      t.float :latitude, default: false
      t.float :longitude, default: false
      t.string :image_url

      t.timestamps
    end
  end
end

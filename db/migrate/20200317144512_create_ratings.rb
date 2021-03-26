class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :climbing_center, index: true
      t.integer :ambiance      
      t.integer :cleanliness
      t.integer :service
      t.integer :route

      t.timestamps
    end
  end
end

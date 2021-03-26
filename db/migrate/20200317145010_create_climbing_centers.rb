class CreateClimbingCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :climbing_centers do |t|
      t.string :name
      t.string :address
      t.float :latitude, default: false
      t.float :longitude, default: false
      t.text :hours
      t.string :image_url
      t.integer :size
      t.string :facebook
      t.string :instagram
      t.string :linkedin
      t.string :twitter
      t.string :phone
      t.string :email
      t.boolean :wifi
      t.boolean :restaurant
      t.boolean :pub
      t.text :restaurant_pub_hours
      t.boolean :sauna
      t.boolean :hammam
      t.boolean :workout_space
      t.boolean :yoga_classes
      t.boolean :shop
      t.float :standard_entry
      t.float :standard_entry_reduced
      t.float :standard_entry_under_twelve
      t.float :standard_entry_under_five
      t.float :standard_entry_under_six
      t.float :happy_hours_entry
      t.float :happy_hours_entry_reduced
      t.float :ten_entries
      t.float :ten_entries_reduced
      t.float :ten_entries_happy_hours
      t.float :ten_entries_happy_hours_reduced
      t.float :ten_entries_under_twelve
      t.float :ten_entries_under_six
      t.float :ten_entries_under_five
      t.float :yearly_subscription
      t.float :yearly_subscription_reduced
      t.float :yearly_subscription_couple
      t.float :yearly_subscription_couple_reduced
      t.float :yearly_subscription_child
      t.float :yearly_subscription_one_center
      t.float :yearly_subscription_reduced_one_center
      t.float :yearly_subscription_one_center_under_twelve
      t.float :yearly_subscription_happy_hours
      t.float :monthly_subscription
      t.float :monthly_subscription_reduced
      t.float :monthly_subscription_happy_hours
      t.float :monthly_subscription_couple
      t.float :monthly_subscription_couple_reduced
      t.float :monthly_subscription_child
      t.float :monthly_subscription_reduced_happy_hours
      t.float :yearly_subscription_reduced_happy_hours
      t.text :conditions
      t.boolean :climbing_wall
      t.string :url
      t.float :climbing_shoes
      t.float :climbing_shoes_reduced
      t.integer :average_ambiance
      t.integer :average_cleanliness
      t.integer :average_service
      t.integer :average_route
      t.integer :average_total_rating
      t.belongs_to :city, index: true


      t.timestamps
    end
  end
end

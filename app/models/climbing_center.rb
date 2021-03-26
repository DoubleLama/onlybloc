class ClimbingCenter < ApplicationRecord
  has_many :ratings
  belongs_to :city, optional: true
  has_many :comments, dependent: :destroy
  has_many :users, through: :ratings
  attr_accessor :price_type
  geocoded_by :address, latitude: :lat, longitude: :lon

#Filter services
scope :hammam, -> {where(hammam: true)}
scope :shop, -> {where(shop: true)}
scope :yoga_classes, -> {where(yoga_classes: true)}
scope :workout_space, -> {where(workout_space: true)}
scope :sauna, -> {where(sauna: true)}
scope :restaurant, -> {where(restaurant: true)}
scope :pub, -> {where(pub: true)}
scope :climbing_wall, -> {where(climbing_wall: true)}

#Filter price
scope :standard_entry, -> {where("standard_entry > 0")}
scope :standard_entry_reduced, -> {where("standard_entry_reduced>0")}
scope :standard_entry_under_twelve, ->{where("standard_entry_under_twelve>0")}
scope :standard_entry_under_five, -> {where("standard_entry_under_five > 0")}
scope :standard_entry_under_six, -> {where("standard_entry_under_six > 0")}
scope :happy_hours_entry, ->{where("happy_hours_entry>0")}
scope :happy_hours_entry_reduced, ->{where("happy_hours_entry_reduced>0")}
scope :ten_entries, ->{where("ten_entries>0")}
scope :ten_entries_reduced, ->{where("ten_entries_reduced>0")}
scope :ten_entries_happy_hours, ->{where("ten_entries_happy_hours>0")}
scope :ten_entries_happy_hours_reduced, ->{where("ten_entries_happy_hours_reduced>0")}
scope :ten_entries_under_twelve, ->{where("ten_entries_under_twelve>0")}
scope :ten_entries_under_six, ->{where("ten_entries_under_six>0")}
scope :yearly_subscription, ->{where("yearly_subscription>0")}
scope :yearly_subscription_reduced, ->{where("yearly_subscription_reduced>0")}
scope :yearly_subscription_couple, ->{where("yearly_subscription_couple>0")}
scope :yearly_subscription_couple_reduced, ->{where("yearly_subscription_couple_reduced>0")}
scope :yearly_subscription_child, ->{where("yearly_subscription_child>0")}
scope :yearly_subscription_one_center, ->{where("yearly_subscription_one_center>0")}
scope :yearly_subscription_reduced_one_center, ->{where("yearly_subscription_reduced_one_center>0")}
scope :yearly_subscription_one_center_under_twelve, ->{where("yearly_subscription_one_center_under_twelve>0")}
scope :yearly_subscription_happy_hours, ->{where("yearly_subscription_happy_hours>0")}
scope :monthly_subscription, ->{where("monthly_subscription>0")}
scope :monthly_subscription_reduced, ->{where("monthly_subscription_reduced>0")}
scope :monthly_subscription_happy_hours, ->{where("monthly_subscription_happy_hours>0")}
scope :monthly_subscription_couple, ->{where("monthly_subscription_couple>0")}
scope :monthly_subscription_couple_reduced, ->{where("monthly_subscription_couple_reduced>0")}
scope :monthly_subscription_child, ->{where("monthly_subscription_child>0")}

# Filter Profile
scope :happy_hours, ->{happy_hours_entry.or(happy_hours_entry_reduced).or(ten_entries_happy_hours).or(yearly_subscription_happy_hours).or(monthly_subscription_happy_hours)}
scope :couple, ->{yearly_subscription_couple.or yearly_subscription_couple_reduced.or monthly_subscription_couple}
scope :reduced, ->{happy_hours_entry_reduced.or(ten_entries_reduced).or(ten_entries_happy_hours_reduced).or(yearly_subscription_reduced).or(yearly_subscription_couple_reduced).or(yearly_subscription_reduced_one_center).or(monthly_subscription_reduced).or(monthly_subscription_couple_reduced)}
scope :standard, ->{happy_hours_entry.or(happy_hours_entry).or(standard_entry).or(ten_entries).or(ten_entries_happy_hours).or(yearly_subscription).or(yearly_subscription_one_center).or(yearly_subscription_happy_hours).or(monthly_subscription).or(monthly_subscription_happy_hours)}
scope :child, ->{standard_entry_under_twelve.or(standard_entry_under_five).or(standard_entry_under_six).or(ten_entries_under_twelve).or(ten_entries_under_six).or(yearly_subscription_child).or(yearly_subscription_one_center_under_twelve).or(monthly_subscription_child)}

#Filter entry
scope :ten, ->{ten_entries.or(ten_entries_reduced).or(ten_entries_happy_hours).or(ten_entries_happy_hours_reduced).or(ten_entries_happy_hours_reduced).or(ten_entries_under_twelve).or(ten_entries_under_six)}
scope :monthly, ->{monthly_subscription.or(monthly_subscription_reduced).or(monthly_subscription_happy_hours).or(monthly_subscription_couple).or(monthly_subscription_couple_reduced).or(monthly_subscription_child)}
scope :yearly, ->{yearly_subscription.or(yearly_subscription_reduced).or(yearly_subscription_couple).or(yearly_subscription_couple_reduced).or(yearly_subscription_child).or(yearly_subscription_one_center).or(yearly_subscription_reduced_one_center).or(yearly_subscription_one_center_under_twelve).or(yearly_subscription_happy_hours)}
scope :one_entry, ->{standard_entry.or(standard_entry_reduced).or(standard_entry_under_twelve).or(standard_entry_under_five).or(standard_entry_under_six).or(standard_entry_under_six).or(happy_hours_entry).or(happy_hours_entry_reduced)}

end

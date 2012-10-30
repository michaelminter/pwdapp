class Location < ActiveRecord::Base
  attr_accessible :badge, :location_group_id, :name
  
  has_many :user_locations
  has_one :location_group
  
  scope :not_in_user_locations, lambda { |user| { :conditions => ['locations.id NOT IN (SELECT locations.id FROM locations JOIN user_locations ON user_locations.location_id = locations.id WHERE user_locations.user_id = ?)', user.id] }}
end

class UserLocation < ActiveRecord::Base
  attr_accessible :location_id, :login_name, :user_id
  
  belongs_to :user
  belongs_to :location
end

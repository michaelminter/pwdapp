class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :login_name

      t.timestamps
    end
  end
end

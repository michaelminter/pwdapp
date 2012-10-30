class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :badge
      t.integer :location_group_id

      t.timestamps
    end
  end
end

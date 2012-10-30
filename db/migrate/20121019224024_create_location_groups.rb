class CreateLocationGroups < ActiveRecord::Migration
  def change
    create_table :location_groups do |t|
      t.integer :order
      t.string :name

      t.timestamps
    end
  end
end

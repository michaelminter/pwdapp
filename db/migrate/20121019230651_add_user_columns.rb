class AddUserColumns < ActiveRecord::Migration
  def up    
    add_column :users, :full_name, :string
    add_column :users, :cell_phone, :string
    add_column :users, :regen_time, :time
    add_column :users, :requests_newsletter, :boolean, :default => true
    add_column :users, :active, :boolean, :default => true
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :sync_password, :string
  end

  def down
    remove_column :users, :full_name
    remove_column :users, :cell_phone
    remove_column :users, :regen_time
    remove_column :users, :requests_newsletter
    remove_column :users, :active
    remove_column :users, :admin
    remove_column :users, :sync_password
  end
end

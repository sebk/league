class AddAdminForMembership < ActiveRecord::Migration
  def self.up
    add_column :teammemberships, :admin, :boolean    
  end

  def self.down
    remove_column :teammemberships, :admin
  end
end

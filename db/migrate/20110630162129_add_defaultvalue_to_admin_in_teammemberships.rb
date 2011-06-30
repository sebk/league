class AddDefaultvalueToAdminInTeammemberships < ActiveRecord::Migration
  def self.up
    change_column :teammemberships, :admin, :boolean, :default => false
  end

  def self.down
  end
end

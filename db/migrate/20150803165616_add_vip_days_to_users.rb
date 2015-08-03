class AddVipDaysToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :vip_days, :integer
  end
end

class AddDistrictIdToAdmin < ActiveRecord::Migration
  def change
  	add_column :users, :district_id, :integer
  	add_index :users, :district_id
  end
end

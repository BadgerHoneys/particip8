class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.belongs_to :school, index: true

      t.timestamps null: false
    end
  end

	#need to consider foreign key to schools
end

class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :current_day, index: true
      t.belongs_to :user, index: true
      t.boolean :is_there

      t.timestamps null: false
    end
    add_foreign_key :attendances, :current_days
    add_foreign_key :attendances, :users
  end
end

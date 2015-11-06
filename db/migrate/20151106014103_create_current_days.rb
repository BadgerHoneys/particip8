class CreateCurrentDays < ActiveRecord::Migration
  def change
    create_table :current_days do |t|
      t.date :day
      t.belongs_to :school_class, index: true

      t.timestamps null: false
    end
    add_foreign_key :current_days, :school_classes
  end
end

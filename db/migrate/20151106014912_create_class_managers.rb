class CreateClassManagers < ActiveRecord::Migration
  def change
    create_table :class_managers do |t|
      t.belongs_to :school_class, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :class_managers, :school_classes
    add_foreign_key :class_managers, :users
  end
end

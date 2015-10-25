class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.belongs_to :school, index: true
      t.belongs_to :teacher, index: true
      t.string :name
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
    add_foreign_key :school_classes, :schools
    
    #need to have foreign key to users / teachers
    #add_foreign_key :school_classes, :teachers
  end
end

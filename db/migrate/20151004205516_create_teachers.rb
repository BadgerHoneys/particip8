class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.belongs_to :school, index: true
      t.string :password

      t.timestamps null: false
    end
    add_foreign_key :teachers, :schools
  end
end

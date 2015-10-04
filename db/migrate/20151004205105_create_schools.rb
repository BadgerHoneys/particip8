class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.belongs_to :district, index: true

      t.timestamps null: false
    end
    add_foreign_key :schools, :districts
  end
end

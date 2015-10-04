class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.belongs_to :evaluation_template, index: true

      t.timestamps null: false
    end
    add_foreign_key :evaluations, :evaluation_templates
  end
end

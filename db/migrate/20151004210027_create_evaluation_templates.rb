class CreateEvaluationTemplates < ActiveRecord::Migration
  def change
    create_table :evaluation_templates do |t|
      t.string :name
      t.belongs_to :school_class, index: true
      t.belongs_to :rating_type, index: true
      t.belongs_to :evaluation_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :evaluation_templates, :school_classes
    add_foreign_key :evaluation_templates, :rating_types
    add_foreign_key :evaluation_templates, :evaluation_types
  end
end

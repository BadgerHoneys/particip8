class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :evaluation, index: true
      t.string :rating_value
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :ratings, :evaluations
    add_foreign_key :ratings, :users
  end
end

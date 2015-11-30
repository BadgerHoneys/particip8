class AddDaysToClasses < ActiveRecord::Migration
  def change
    add_column :school_classes, :days, :string
  end
end

class JoinTableSchoolClassesStudents < ActiveRecord::Migration
  def change
    create_join_table :school_classes, :students do |t|
      t.index [:school_class_id, :student_id], name: 'classes_students'
      t.index [:student_id, :school_class_id], name: 'students_classes'
    end
  end
end

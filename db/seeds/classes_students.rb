connection = ActiveRecord::Base.connection()
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('1', '1');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('1', '2');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('1', '3');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('2', '5');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('2', '2');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('2', '1');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('3', '1');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('3', '4');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('4', '1');")
connection.execute("INSERT INTO `db/development.mysql2`.`school_classes_students` (`school_class_id`, `student_id`) VALUES ('4', '2');")
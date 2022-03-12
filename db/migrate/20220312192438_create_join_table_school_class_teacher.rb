class CreateJoinTableSchoolClassTeacher < ActiveRecord::Migration[7.0]
  def change
    create_join_table :school_classes, :teachers do |t|
      t.index [:school_class_id, :teacher_id]
      t.index [:teacher_id, :school_class_id]
    end
  end
end

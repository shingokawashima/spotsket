class AddStudentImageToStudents < ActiveRecord::Migration
  def change
    add_column :students, :student_image, :string
  end
end

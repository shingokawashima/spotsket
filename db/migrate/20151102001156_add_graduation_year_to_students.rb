class AddGraduationYearToStudents < ActiveRecord::Migration
  def change
    add_column :students, :graduation_year, :integer
  end
end

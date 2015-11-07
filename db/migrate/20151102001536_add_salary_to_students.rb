class AddSalaryToStudents < ActiveRecord::Migration
  def change
    add_column :students, :salary, :integer
  end
end

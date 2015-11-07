class AddUniversityToStudents < ActiveRecord::Migration
  def change
    add_column :students, :university, :string
  end
end

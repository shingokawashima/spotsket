class AddSkillsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :skills, :string
  end
end

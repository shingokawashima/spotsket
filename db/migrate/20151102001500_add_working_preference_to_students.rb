class AddWorkingPreferenceToStudents < ActiveRecord::Migration
  def change
    add_column :students, :working_preference, :string
  end
end

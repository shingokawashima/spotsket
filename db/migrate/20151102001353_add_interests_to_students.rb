class AddInterestsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :interests, :string
  end
end

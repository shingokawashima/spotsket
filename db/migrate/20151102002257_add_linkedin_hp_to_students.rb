class AddLinkedinHpToStudents < ActiveRecord::Migration
  def change
    add_column :students, :linkedin_hp, :string
  end
end

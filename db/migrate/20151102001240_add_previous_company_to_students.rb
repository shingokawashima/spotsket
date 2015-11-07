class AddPreviousCompanyToStudents < ActiveRecord::Migration
  def change
    add_column :students, :previous_company, :string
  end
end

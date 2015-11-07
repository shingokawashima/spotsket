class AddPersonToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :person, :string
  end
end

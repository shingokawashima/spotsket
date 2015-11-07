class AddCompanySizeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_size, :string
  end
end

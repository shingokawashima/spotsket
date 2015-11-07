class AddCompanyHpToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_hp, :string
  end
end

class AddCompanyimageToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_image, :string
  end
end

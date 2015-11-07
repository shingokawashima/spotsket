class CompaniesController < ApplicationController
  def index
    if company_signed_in?
      @projects = current_company.projects
    end
  end
end

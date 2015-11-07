class StaticPagesController < ApplicationController
  def home
    if student_signed_in?
      redirect_to '/students'
    elsif company_signed_in?
      redirect_to '/companies'
    end
  end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include StudentsessionsHelper
  
  # private
  # def logged_in_student
  #   unless student_logged_in?
  #     student_store_location
  #     flash[:danger] = "Please log in."
  #     redirect_to student_login_url
  #   end
  # end
end

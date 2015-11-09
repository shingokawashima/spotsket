class StudentsController < ApplicationController
  before_action :set_student, only: [:profile]

  def index
    @projects = Project.where('closed_on >= ?', DateTime.now).where(assigned_student: nil)
    @student = current_student
  end
  
  def profile
  
  end
  
  private
  
  def set_student
    @student = Student.find(params[:id])
  end
  
  
end

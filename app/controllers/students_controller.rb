class StudentsController < ApplicationController
  def index
    @projects = Project.where('closed_on >= ?', DateTime.now)
    @student = current_student
  end
end

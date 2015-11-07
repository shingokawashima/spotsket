class StudentsController < ApplicationController
  def index
    @projects = Project.all
  end
end

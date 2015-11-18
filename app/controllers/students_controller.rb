# -*- coding: utf-8 -*-
class StudentsController < ApplicationController
  layout 'basic'
  before_action :set_student, only: [:profile]

  def index
    @projects = Project.where('closed_on >= ?', DateTime.now).where(assigned_student: nil)
    #if current_student.received_messages.where(read_flg: false).count > 0
     # flash[:notice] = "新しいメッセージがあります"
    #end
  end
  
  def yourprojects
    @projects = current_student.bidding_projects.all
  end
  
  def profile
  end
  
  private
  
  def set_student
    @student = Student.find(params[:id])
  end
  
  
end

# -*- coding: utf-8 -*-
class ProjectsController < ApplicationController
  ##before_action :company_signed_in, only: [:new, :create]
  before_action :set_project, only: [:show, :edit, :update, :destroy, :bids]
  
  def new
    @project = Project.new
  end
  
  def create
    @project = current_company.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to @project
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      redirect_to root_path , notice: '案件内容を編集しました'
    else
      render 'edit'
    end
  end
  
  def destroy
    @project.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  def bid
    @project = Project.find(params[:id])
    @bid = Bid.create(bidder: current_student, bidded: @project, bidding_type: "Interested")
    flash[:success] = "Thank you for your interest"
    redirect_to @project
  end
    
  def unbid
    @project = Project.find(params[:id])
    @bid = Bid.find_by(bidder: current_student, bidded: @project).destroy
    flash[:success] = "Delete your interest"
    redirect_to @project
  end
  
  def bids
    @students = @project.bidded_students.all
    @bid = Bid.find_by(bidded: @project)
  end
  
  def assigned
    @project = Project.find(params[:project_id])
    student = Student.find(params[:id])
    @project.assigned_student = student
    @project.save
    redirect_to root_path, notice: 'You assigned a student to your project'
  end 
    
  private
  
  def project_params
    params.require(:project).permit(:name, :description, :project_type, :period, :budget, :hours, :closed_on, :required_skills, :required_background, :emergent, :assigned)
  end
  
  def set_project
    @project = Project.find(params[:id])
  end
  
end

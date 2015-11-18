class MessagesController < ApplicationController
  layout 'basic'
  before_action :set_student, only: [:new, :create,:update]
  before_action :set_company, only: [:new, :create,:update]
  
  def index
    if student_signed_in?
      @student = current_student
      @messages = current_student.messages
      @companies = @student.mailing_companies.uniq
    end
    if company_signed_in?
      @company = current_company
      @messages = current_company.messages
      @students = @company.mailing_students.uniq
    end
  end
  
  
  def new
    @messages = Message.all.where(student: @student).where(company: @company)
  end
  
  def update
    if student_signed_in?
      @messages = CompanyMessage.where(student: current_student)
      @messages.each do |message|
        if !message.read?
          message.read_flg = true
          message.save
        end
      end
    end
    if company_signed_in?
      @messages = StudentMessage.where(company: current_company)
      @messages.each do |message|
        if !message.read?
          message.read_flg = true
          message.save
        end
      end
    end
    redirect_to message_path(@student, @company)
  end
  
  def create
    if student_signed_in?
      @message = StudentMessage.new
      @message.content = params[:content]
      @message.student = current_student
      @message.company = @company
      @message.sender = current_student.name
      @message.save
      redirect_to message_path(@student, @company), notice: 'Sent your message'
    end
    if company_signed_in?
      @message = CompanyMessage.new
      @message.content = params[:content]
      @message.student = @student
      @message.company = current_company
      @message.sender = current_company.company_name
      @message.save
      redirect_to message_path(@student, @company), notice: 'Sent your message'
    end
  end
  
  private
  def set_student
    @student = Student.find(params[:student_id])
  end
  
  def set_company
    @company = Company.find(params[:id])
  end
end

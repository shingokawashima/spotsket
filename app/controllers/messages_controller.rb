class MessagesController < ApplicationController
  before_action :set_student, only: [:new, :create,:update]
  before_action :set_company, only: [:new, :create,:update]
  
  def index
    @student = current_student
    @messages = current_student.messages
    @companies = @student.mailing_companies.uniq
  end
  
  
  def new
    @messages = Message.all.where(student: @student).where(company: @company)
  end
  
  def update
      if student_signed_in?
        @messages = Message.all.where(student: @student).where(company: @company).where(sender: "Company")
        @messages.each do |message|
          message.read_flg = "Read"
          message.save
        end
      end
      if company_signed_in?
        @messages = Message.all.where(student: @student).where(company: @company).where(sender: "Student")
        @messages.each do |message|
          message.read_flg = "Read"
          message.save
        end        
      end
      redirect_to message_path(@student, @company)
  end
  
  def create
    if student_signed_in?
      @message = Message.new
      @message.content = params[:content]
      @message.student = @student
      @message.company = @company
      @message.type = "Student"
      @message.sender = current_student.name
      @message.read_flg = "Unread"
      @message.save
      redirect_to message_path(@student, @company), notice: 'Sent your message'
    end
    if company_signed_in?
      @message = Message.new
      @message.content = params[:content]
      @message.student = @student
      @message.company = @company
      @message.type = "Company"
      @message.sender = current_company.company_name
      @message.read_flg = "Unread"
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

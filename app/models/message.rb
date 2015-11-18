class Message < ActiveRecord::Base
  belongs_to :company, class_name: "Company"
  belongs_to :student, class_name: "Student"
  
  belongs_to :mailing_student, class_name: "Student", foreign_key: "student_id", dependent: :destroy
  belongs_to :mailing_company, class_name: "Company", foreign_key: "company_id", dependent: :destroy

  def read?
    read_flg
  end

end

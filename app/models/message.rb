class Message < ActiveRecord::Base
  belongs_to :company, class_name: "Company"
  belongs_to :student, class_name: "Student"
end

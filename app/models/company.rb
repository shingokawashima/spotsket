class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :projects, class_name: "Project"

  has_many :messages, class_name: "Message", foreign_key: "company_id"
  has_many :sent_messages, class_name: "ComapanyMessage", foreign_key: "company_id"
  has_many :received_messages, class_name: "StudentMessage", foreign_key: "company_id"

  # has_many :messages, class_name: "Message"
  
  #has_many :companymailing_messages, class_name: "Message", foreign_key: "company_id", dependent: :destroy
  
  # has_many :sent_messages, class_name:  "Message", foreign_key: "company_id", dependent:   :destroy
  # has_many :mailing_students, through: :sent_messages, source: :student
  
end

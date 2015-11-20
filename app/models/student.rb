class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }
  devise :omniauthable, :omniauth_providers => [:facebook]
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_many :messages, class_name: "Message", foreign_key: "student_id"
  has_many :received_messages, class_name: "ComapanyMessage", foreign_key: "student_id"
  has_many :sent_messages, class_name: "StudentMessage", foreign_key: "student_id"

  # has_many :messages, class_name: "Message"
  #has_many :projects, class_name: "Project"
  #has_many :bids, class_name: "Bid"
  
  has_many :bidding_bids, class_name:  "Bid",
                                     foreign_key: "bidder_id",
                                     dependent:   :destroy
  has_many :bidding_projects, through: :bidding_bids, source: :bidded
  
  # has_many :sending_messages, class_name:  "Message", foreign_key: "student_id", dependent:   :destroy
  has_many :mailing_companies, through: :messages, source: :company
  
  #has_many :studentmailing_messages, class_name: "Message", foreign_key: "student_id", dependent: :destroy
  
  has_many :assigning_projects, class_name: "Project", foreign_key: "assigned_id", dependent: :destroy
  
  mount_uploader :student_image, StudentimageUploader
  
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |student|
    student.email = auth.info.email
    student.password = Devise.friendly_token[0,20]
    student.password_confirmation = Devise.friendly_token[0,20]
    student.name = auth.info.name   # assuming the user model has a name
    student.student_image = auth.info.image # assuming the user model has an image
  end
  end
  
  def self.new_with_session(params, session)
    super.tap do |student|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          student.email = data["email"] if student.email.blank?
      end
    end
  end
  
  

  def bidding?(project)
   bidding_projects.include?(project)
  end
  
  
end

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_many :messages, class_name: "Message"
  #has_many :projects, class_name: "Project"
  #has_many :bids, class_name: "Bid"
  
  has_many :bidding_bids, class_name:  "Bid",
                                     foreign_key: "bidder_id",
                                     dependent:   :destroy
  has_many :bidding_projects, through: :bidding_bids, source: :bidded
  
  has_many :sending_messages, class_name:  "Message", foreign_key: "student_id", dependent:   :destroy
  has_many :mailing_companies, through: :sending_messages, source: :company
  
  #has_many :studentmailing_messages, class_name: "Message", foreign_key: "student_id", dependent: :destroy
  
  has_many :assigning_projects, class_name: "Project", foreign_key: "assigned_id", dependent: :destroy

  def bidding?(project)
   bidding_projects.include?(project)
  end
  
  
end

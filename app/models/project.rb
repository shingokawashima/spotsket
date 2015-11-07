class Project < ActiveRecord::Base
  belongs_to :company, class_name: "Company"
  belongs_to :bids, class_name: "Bid"
  
  has_many :bidded_bids, class_name:  "Bid",
                                     foreign_key: "bidded_id",
                                     dependent:   :destroy
  has_many :bidded_students, through: :bidded_bids, source: :bidder

end

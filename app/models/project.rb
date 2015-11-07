class Project < ActiveRecord::Base
  belongs_to :company, class_name: "Company"
  belongs_to :bids, class_name: "Bid"

end

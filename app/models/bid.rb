class Bid < ActiveRecord::Base
  belongs_to :bidder, class_name: "Student"
  belongs_to :bidded, class_name: "Project"
end

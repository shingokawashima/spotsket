class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :bidder, index: true
      t.references :bidded, index: true
      t.string :bidding_type

      t.timestamps null: false
      
      t.index [:bidder_id, :bidded_id], unique: true
    end
  end
end

class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :buyer_id
      t.integer :business_id
      t.float :bid_price
      t.integer :closing_timeline
      t.float :cash_consid
      t.float :eq_consid
      t.boolean :winning_bid
      t.timestamps
    end
  end
end

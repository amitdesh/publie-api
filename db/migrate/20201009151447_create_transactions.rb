class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :bid_id
      t.timestamps
    end
  end
end

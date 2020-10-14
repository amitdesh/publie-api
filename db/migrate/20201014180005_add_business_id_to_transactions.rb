class AddBusinessIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :business_id, :integer
  end
end

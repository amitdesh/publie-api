class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :industry
      t.string :founder_name
      t.string :biz_type
      t.integer :employees
      t.float :revenue
      t.text :description
      t.integer :seller_id
      t.timestamps
    end
  end
end

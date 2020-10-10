class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.float :aum
      t.string :prof_pic
      t.string :industry

      t.timestamps
    end
  end
end

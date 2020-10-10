class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :prof_pic
      t.timestamps
    end
  end
end

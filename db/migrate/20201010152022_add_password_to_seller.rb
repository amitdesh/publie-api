class AddPasswordToSeller < ActiveRecord::Migration[6.0]
  def change
    add_column :sellers, :password_digest, :string
  end
end

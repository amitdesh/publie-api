class RemoveProfPicFromSeller < ActiveRecord::Migration[6.0]
  def change
    remove_column :sellers, :prof_pic
  end
end

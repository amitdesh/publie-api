class SellerSerializer < ActiveModel::Serializer
  attributes :id, :email_address, :first_name, :last_name, :prof_pic
end

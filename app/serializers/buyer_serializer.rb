class BuyerSerializer < ActiveModel::Serializer
  attributes :id, :email_address, :first_name, :last_name, :company_name, :aum, :prof_pic, :industry
  # has_many :bids
  # has_many :businesses, through: :bids
end

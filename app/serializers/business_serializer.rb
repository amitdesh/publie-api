class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :industry, :founder_name, :biz_type, :employees, :revenue, :description, :seller_id
  belongs_to :seller
  has_many :bids
  has_many :buyers, through: :bids
end

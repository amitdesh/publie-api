class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :buyer_id, :seller_id, :bid_id
  belongs_to :buyer
  belongs_to :seller
  belongs_to :bid
  belongs_to :business
end

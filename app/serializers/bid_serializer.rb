class BidSerializer < ActiveModel::Serializer
  attributes :id, :buyer_id, :business_id, :bid_price, :closing_timeline, :cash_consid, :eq_consid, :winning_bid
end

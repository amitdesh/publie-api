class Transaction < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  has_one :bid
end

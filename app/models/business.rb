class Business < ApplicationRecord
    belongs_to :seller
    has_many :bids
    has_many :buyers, through: :bids
end

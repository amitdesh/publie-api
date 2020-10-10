class Buyer < ApplicationRecord
    has_many :bids
    has_many :businesses, through: :bids
    has_secure_password
end

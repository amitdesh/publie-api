class Buyer < ApplicationRecord
    has_many :bids
    has_many :businesses, through: :bids
    has_secure_password
    has_one_attached :profile_picture
end

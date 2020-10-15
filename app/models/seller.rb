class Seller < ApplicationRecord
  has_many :businesses
  has_many :bids, through: :businesses
  has_secure_password
  has_one_attached :profile_picture
end

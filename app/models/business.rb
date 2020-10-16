class Business < ApplicationRecord
    belongs_to :seller
    has_many :bids
    has_many :buyers, through: :bids
    has_one_attached :biz_picture
end

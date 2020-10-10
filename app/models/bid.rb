class Bid < ApplicationRecord
    belongs_to :business
    belongs_to :buyer

end

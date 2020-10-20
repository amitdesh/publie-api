class BuyerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email_address, :first_name, :last_name, :company_name, :aum, :industry, :profile_pic
  has_many :bids
  has_many :businesses, through: :bids

  def profile_pic
    return unless object.profile_pic.attached?

    object.profile_pic.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: profile_pic_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def profile_pic_url
    url_for(object.profile_pic)
  end
end

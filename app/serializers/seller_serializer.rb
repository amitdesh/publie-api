class SellerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email_address, :first_name, :last_name, :profile_picture
  has_many :businesses
  has_many :bids, through: :businesses

  def profile_picture
    return unless object.profile_picture.attached?

    object.profile_picture.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: profile_picture_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def profile_picture_url
    url_for(object.profile_picture)
  end
end

class BusinessSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :location, :industry, :founder_name, :biz_type, :employees, :revenue, :description, :seller_id, :biz_picture
  belongs_to :seller
  has_many :bids
  has_many :buyers, through: :bids

  def biz_picture
    return unless object.biz_picture.attached?

    object.biz_picture.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: biz_picture_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def biz_picture_url
    url_for(object.biz_picture)
  end
end

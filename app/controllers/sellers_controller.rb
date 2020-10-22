class SellersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def index
    @sellers = Seller.all

    render json: @sellers.with_attached_image
  end

  def profile
    render json: { seller: SellerSerializer.new(current_user) }, status: :accepted
  end

  def create
    @seller = Seller.create(seller_params)
    @seller.profile_picture.attach(params[:seller][:profile_picture])
    picture_url = url_for(@seller.profile_picture)
    # byebug
    if @seller.valid?
      @token = encode_token(seller_id: @seller.id)
      render json: { seller: SellerSerializer.new(@seller), jwt: @token, picture: picture_url }, status: :created
    else
      render json: { error: 'Unable to create new profile. Please try again.' }, status: :not_acceptable
    end
  end

  def update
    @seller = Seller.find(params[:id])
    @seller.update(seller_params)
    @token = encode_token(seller_id: @seller.id)
    render json: { Seller: SellerSerializer.new(@seller), jwt: @token }, status: :created
  end

  def destroy
    @seller = Seller.find(params[:id])
    @seller.delete
  end

  private

  def seller_params
    params.require(:seller).permit(:email_address, :password, :first_name, :last_name, :profile_picture)
  end
end

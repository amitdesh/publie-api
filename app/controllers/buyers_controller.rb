class BuyersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def index
    @buyers = Buyer.all

    render json: @buyers
  end

  def profile
    render json: { buyer: BuyerSerializer.new(current_user) }, status: :accepted
  end

  def create
    @buyer = Buyer.create(buyer_params)
    # byebug
    if @buyer.valid?
      @token = encode_token(buyer_id: @buyer.id)
      render json: { buyer: BuyerSerializer.new(@buyer), jwt: @token }, status: :created
    else
      render json: { error: 'Unable to create new profile. Please try again.' }, status: :not_acceptable
    end
  end

  def update
    @buyer = Buyer.find(params[:id])
    @buyer.update(buyer_params)
    @token = encode_token(buyer_id: @buyer.id)
    render json: { Buyer: BuyerSerializer.new(@buyer), jwt: @token }, status: :created
  end

  def destroy
    @buyer = Buyer.find(params[:id])
    @buyer.delete
  end

  private

  def buyer_params
    params.require(:buyer).permit(:email_address, :password, :first_name, :last_name, :company_name, :aum, :prof_pic, :industry, :profile_picture)
  end
end

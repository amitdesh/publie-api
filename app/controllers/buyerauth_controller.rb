class BuyerauthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    # byebug
    @buyer = Buyer.find_by(email_address: buyer_login_params[:email_address])
    # buyer#authenticate comes from BCrypt
    if @buyer&.authenticate(buyer_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ buyer_id: @buyer.id })
      render json: { buyer: BuyerSerializer.new(@buyer), jwt: token , picture: picture_url }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def buyer_login_params
    # params { buyer: {buyername: 'Chandler Bing', password: 'hi' } }
    params.require(:buyerauth).permit(:email_address, :password)
  end
end

class SellerauthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    # byebug
    @seller = Seller.find_by(email_address: seller_login_params[:email_address])
    # seller#authenticate comes from BCrypt
    if @seller&.authenticate(seller_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ seller_id: @seller.id })
      render json: { seller: SellerSerializer.new(@seller), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def seller_login_params
    # params { seller: {sellername: 'Chandler Bing', password: 'hi' } }
    params.require(:sellerauth).permit(:email_address, :password)
  end
end

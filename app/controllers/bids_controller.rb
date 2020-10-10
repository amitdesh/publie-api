class BidsController < ApplicationController
  def index
    @bids = Bid.all

    render json: @bids
  end

  def create
    @bid = Bid.create(Bid_params)
    # byebug
    if @bid.valid?
      render json: { bid: BidSerializer.new(@bid) }, status: :created
    else
      render json: { error: 'Unable to create new bid. Please try again.' }, status: :not_acceptable
    end
  end

  def update
    @id = Bid.find(params[:id])
    @bid.update(bid_params)
    render json: { bid: BidSerializer.new(@bid) }, status: :created
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.delete
  end

  private

  def bid_params
    params.require(:bid).permit(:buyer_id, :business_id, :bid_price, :closing_timeline, :cash_consid, :eq_consid, :winning_bid)
  end
end
class BusinessesController < ApplicationController
  def index
    # byebug
    @businesses = Business.all

    render json: @businesses
  end

  def create
    @business = Business.create(business_params)
    # byebug
    if @business.valid?
      render json: @business, status: :created
    else
      render json: { error: 'Unable to create new business. Please try again.' }, status: :not_acceptable
    end
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    render json: { Business: BusinessSerializer.new(@business) }, status: :created
  end

  def destroy
    @business = Business.find(params[:id])
    @business.delete
  end

  private

  def business_params
    params.require(:business).permit(:name, :location, :industry, :founder_name, :biz_type, :employees, :revenue, :description, :seller_id)
  end
end
class BusinessesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  def index
    # byebug
    @businesses = Business.all

    render json: @businesses
  end

  def create
    # byebug
    @business = Business.create(business_params)
    # pictures = (params[:business][:biz_pictures])
    # byebug
    # pictures.each do |pic|
    # end
    @business.biz_picture.attach(params[:business][:biz_picture])
    picture_url = url_for(@business.biz_picture)
    # byebug
    # picture_url = url_for(@business.biz_pictures)
    # @business.biz_pictures.each do |pics|
    #   picture_url << url_for(pics)
    # end
    if @business.valid?
      render json: @business, status: :created
    else
      render json: { error: 'Unable to create new business. Please try again.' }, status: :not_acceptable
    end
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    render json: { business: BusinessSerializer.new(@business) }, status: :created
  end

  def destroy
    @business = Business.find(params[:id])
    @business.delete
  end

  private

  def business_params
    params.require(:business).permit(:name, :location, :industry, :founder_name, :biz_type, :employees, :revenue, :description, :seller_id, :biz_picture)
  end
end
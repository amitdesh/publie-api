class TransactionsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        # byebug
        @transactions = Transaction.all
    
        render json: @transactions
      end

      def create
        @transaction = Transaction.create(transaction_params)
        # byebug
        if @transaction.valid?
          render json: @transaction , status: :created
        else
          render json: { error: 'Unable to create new bid. Please try again.' }, status: :not_acceptable
        end
      end

      private
      def transaction_params
        params.require(:transaction).permit(:buyer_id, :bid_id, :seller_id, :business_id)
      end
end

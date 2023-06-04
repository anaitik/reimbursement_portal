class BillsController < ApplicationController
    # before_action :authenticate_user! # Ensure the user is authenticated
    def index
        @bills = Bill.where(employee_id: params[:employee_id])
        render json: @bills
      end
   
    def create
        # byebug
      @bill = Bill.create!(bill_params)
  
      if @bill.save
        render status: :created, json: { message: 'Bill submitted successfully', bill: @bill }
      else
        render status: :unprocessable_entity, json: { error: 'Failed to submit bill' }
      end
    end
    
    
    private
  
    def bill_params
      params.require(:bill).permit(:amount, :bill_type, :employee_id)
    end
  end
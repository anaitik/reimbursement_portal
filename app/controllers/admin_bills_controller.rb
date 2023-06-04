class AdminBillsController < ApplicationController
    before_action :authorize_admin
def index
   @bills = Bill.all
    render json: @bills
end

def update
    @bill = Bill.find(params[:id])
    if @bill.update(bill_params)
      render status: :ok, json: { message: 'Bill updated successfully', bill: @bill }
    else
      render status: :unprocessable_entity, json: { error: 'Failed to update bill' }
    end
end


  private
  def bill_params
    params.require(:bill).permit( :status)
  end
end

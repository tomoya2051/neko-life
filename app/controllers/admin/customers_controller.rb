class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @customer = Customer.find(params[:id])
    @diaries = @customer.diaries
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
        redirect_to admin_path
   else
      render :edit
   end
  end

  def customer_params
    params.require(:customer).permit(:nickname, :email, :is_active )
  end
end

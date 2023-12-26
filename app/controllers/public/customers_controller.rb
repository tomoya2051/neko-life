class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @diaries = @customer.diaries
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
        render "edit"
    else
      redirect_to customer_path(current_customer)
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "更新に成功しました。"
        redirect_to customer_path(@customer.id)
    else
      flash[:notice] = "更新に失敗しました。"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image)
  end
end

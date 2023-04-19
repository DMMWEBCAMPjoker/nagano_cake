class OrdersController < ApplicationController
  def new
    @order = current_customer.orders.new
  end

  def check
  end

  def complete
  end
  
  def create
  end

  def index
    @order = Order.find(params[:id])
    @sum=0
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :delivery_name, :delivery_address, :delivery_postcode, :postage, :invoice)
  end
  
  def deliveries_params
    params.require(:oeder).permit(:name, :address, :postcode)
  end
  
end

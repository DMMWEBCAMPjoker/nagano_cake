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
    @orders = current_customer.orders
    @sum = 0
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :delivery_name, :delivery_address, :delivery_postcode, :postage, :invoice)
  end
  
  def delivery_address_params
    params.require(:order).permit(:delivery_name, :delivery_address, :delivery_postcode)
  end
  
end

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
<<<<<<< HEAD
    @orders = current_customer.orders
    @sum = 0
=======
    @order = Order.find(params[:id])
    @sum= 0
>>>>>>> origin/develop
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :delivery_name, :delivery_address, :delivery_postcode, :postage, :invoice)
  end
  
<<<<<<< HEAD
  def delivery_address_params
    params.require(:order).permit(:delivery_name, :delivery_address, :delivery_postcode)
=======
  def deliveries_params
    params.require(:oeder).permit(:name, :address, :postcode)
>>>>>>> origin/develop
  end
  
end

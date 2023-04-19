class OrdersController < ApplicationController
  def new
    @order = orders.new
    @customer = Customer.find(surrent_customer.id)
    @delivery_address = current_customer.destinations
  end

  def check
  end

  def complete
  end

  def create
  end

  def index
    @order = Order.find(params[:id])
    @sum= 0
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

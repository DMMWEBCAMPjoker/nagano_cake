class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @sum = 0
    @order.postage = 800
    if params[:order][:address_number] == "1"
      @order.delivery_name = current_customer.last_name + current_customer.first_name
      @order.delivery_address = current_customer.address
      @order.delivery_postcode = current_customer.postcode

    elsif params[:order][:address_number]  == "2"
      if Delivery.exists?(id: params[:order][:delivery_id])
        @delivery = Delivery.find(params[:order][:delivery_id])
        @order.delivery_address = @delivery.address
        @order.delivery_postcode = @delivery.postcode
        @order.delivery_name = @delivery.name
      else
        render :new
      end

    elsif params[:order][:address_number] == "3"
      delivery_new = current_customer.deliveries.new(delivery_params)
      if delivery_new.save
      else
        render :new
      end
    end
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

  def delivery_params
    params.require(:order).permit(:name, :address, :postcode)
  end

end

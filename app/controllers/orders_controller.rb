class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
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

    elsif params[:order][:address_number] = "3"
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.delivery_postcode = params[:order][:delivery_postcode]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]

    else
      @order = current_customer.deliveries.new
      render :new
    end

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
    if @order.save
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.quantity = cart_item.quantity
        order_item.tax_item_price = cart_item.item.price
        order_item.save
      end
        redirect_to complete_path
        cart_items.destroy_all
    end
  end

  def index
    @orders = current_customer.orders
    @sum = 0
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
    @order.order_items.each do |item|
    @sum = @sum+item.subtotal
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:payment_method, :delivery_name, :delivery_address, :delivery_postcode, :postage, :invoice)
  end

  def delivery_params
    params.require(:order).permit(:name, :address, :postcode)
  end

end

class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.order_items.each do |item|
      @total = @total+item.subtotal
    end
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    # 注文ステータスが入金確認になると製作ステータスを製作中に変更
    if @order.update(order_params)
      @order_items.update_all(production_status: 3) if @order.status == "payment_confirmation"
    end
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:payment_method, :delivery_postcode, :delivery_address, :delivery_name, :postage, :invoice, :status)
  end

end
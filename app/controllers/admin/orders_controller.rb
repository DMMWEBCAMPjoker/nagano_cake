class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
    @order.order_items.each do |item|
    @sum = @sum+item.subtotal
    end
  end

  def update
     @order = Order.find(params[:id])
     @order_item = OrderItem.where(order_id: params[:id])
     #注文ステータスが入金確認になると製作ステータスを製作中に変更
     if @order.update(order_params)
       @order.order_items.update_all(production_status: 2) if @order.status_i18n == "入金確認"
     end
     redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :order_id,)
  end

end
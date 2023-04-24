class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(@order_item.order_id)
    @order_items = @order.order_items.all

    is_updated = true
    if @order_item.update(order_item_params)
      @order.update(status: 3) if @order_item.production_status == "in_production" #製作ステータスが「製作中」の時に、注文ステータスを「製作中」に更新
      @order_items.each do |order_item| #紐づいている注文商品の製作ステータスを1つ1つeach文で確認
        if order_item.production_status != "completion_production" #製作ステータスが「製作完了」ではない場合
          is_updated = false #上で定義しているis_updatedを「false」に変更
        end
      end
    @order.update(status: 4) if is_updated #is_updatedがtrueの場合、注文ステータスが「発送準備中」に更新。上のif文でis_updatedがfalseの場合、更新されない
    end
  redirect_to admin_orders_show_path(@order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end

end

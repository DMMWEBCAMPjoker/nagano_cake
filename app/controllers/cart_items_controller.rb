class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all

    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    redirect_to cart_items_path
  end

  def destroy
    @item = CartItem.find(params[:id])
    @item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_item = CartItem.new(cart_item_params)
    #find_by id以外も持ってこれる カート内に存在していれば足す、していなければ作る
     if CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: params[:cart_item][:customer_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: params[:cart_item][:customer_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.update_attribute(:quantity,cart_item.quantity)
     else
      cart_item = CartItem.new(cart_item_params)
      cart_item.save
     end
      if cart_item.save
      redirect_to  cart_items_path
      else
      redirect_back(fallback_location: root_path)
      end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end

end

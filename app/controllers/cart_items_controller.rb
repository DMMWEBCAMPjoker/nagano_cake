class CartItemsController < ApplicationController

  def index
    #@cart_items = current_customer.cart_items
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
    @item = current_customer.cart_items
    @item.destroy_all
    redirect_to cart_items_path
  end

  def create
    if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.update(quantity: (params[:cart_item][:quantity]).to_i + cart_item.quantity)
      redirect_to cart_items_path
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).parmit(:item_id, :quantity)
  end

end

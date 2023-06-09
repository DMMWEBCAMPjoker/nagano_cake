class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!
   def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
   end


  def create
     @deliveries = Delivery.all
     delivery = Delivery.new(delivery_params)
     delivery.customer_id = current_customer.id
     delivery.save
     redirect_to deliveries_index_path
  end

  def edit
   @delivery = Delivery.find(params[:id])
  end


  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to deliveries_index_path
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_index_path
  end

private
  def delivery_params
   params.require(:delivery).permit(:name, :address, :postcode)
  end

end

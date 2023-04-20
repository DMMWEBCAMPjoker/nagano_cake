class Public::DeliveriesController < ApplicationController
   def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
   end

  def edit
  end

  def create
     @deliveries = Delivery.all
     delivery = Delivery.new(delivery_params)
     delivery.customer_id = current_customer.id
     delivery.save
     redirect_to deliveries_index_path
  end

  def update
  end

  def destroy
  end


  private

 def delivery_params
  params.require(:delivery).permit(:name, :address, :postcode)
 end

end

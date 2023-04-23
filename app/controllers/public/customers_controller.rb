class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
     if @customer.update(customer_params)
        redirect_to customers_my_page_path
     else
        redirect_to customers_infomation_edit_path
     end
  end

  def unsbscribe
    @customer = current_customer
  end

  def withdrow
    @customer = current_customer
    @customer.update(is_deleted: true)
    if @customer.save
      reset_session
      flash[:messege] = "ご利用ありがとうございました。またのご利用お待ちしています"
      redirect_to root_path
    end
  end


 private


  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana,
    :last_name_kana, :postcode, :address, :telephone_number, :email, :is_deleted)
  end
end

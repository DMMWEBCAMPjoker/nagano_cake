class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?


 def after_sign_up_path_for(resource)
   if current_customer
     customers_my_page_path
   end
 end


   def after_sign_in_path_for(resource)
      if current_customer
        customers_my_page_path
      elsif @admin
        admin_orders_path
      else
        root_path
      end
   end


   def after_sign_out_path_for(resource_or_scope)
     if resource_or_scope == :current_customer
        root_path
     elsif resource_or_scope == :admin
        new_admin_session_path
     else
        root_path
     end
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,
    :last_name_kana, :first_name_kana, :postcode, :address, :telephone_number,
    :email, :encrypted_password])
  end
end

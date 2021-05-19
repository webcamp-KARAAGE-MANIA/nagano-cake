class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters , if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_products_path  #Adminのログイン後
    when Customer
      root_path            #Coustomerのログイン後
    end
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :surname,
      :name_kana,
      :surname_kana,
      :email,
      :postal_code,
      :phone_number,
      :address,
      ])
  end

end

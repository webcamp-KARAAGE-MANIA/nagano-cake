class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_products_path  #Adminのログイン後
    when Customer
                    #Coustomerのログイン後
    end
  end

  def after_sign_out_path_for(resource)
    new_customer_registration_path # ログアウト後に遷移するpathを設定
  end

end

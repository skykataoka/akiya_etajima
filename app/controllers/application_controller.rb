class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_actionで下で定義したメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  #変数PERMISSIBLE_ATTRIBUTESに配列[:name]を代入
  PERMISSIBLE_ATTRIBUTES = %i(name)

  #ログイン後のリダイレクトをログイン前のページにする場合
  def after_sign_in_path_for(resource)
    session[:referrer] || root_path
  end
  
  protected

    #deviseのストロングパラメーターにカラム追加するメソッドを定義
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday,
                                                         :avator,
                                                         :address,
                                                         :introduction,
                                                         :want_to_do,
                                                         :hobby,
                                                         :skill,
                                                         :occupation,
                                                         :sex,
                                                         :spouse,
                                                         :child,
                                                         :number_of_occupants,
                                                         :budget_for_rent,
                                                         :budget_for_buy,
                                                         :status
                                                        ])
      devise_parameter_sanitizer.permit(:account_update, keys: [:birthday,
                                                         :avator,
                                                         :address,
                                                         :introduction,
                                                         :want_to_do,
                                                         :hobby,
                                                         :skill,
                                                         :occupation,
                                                         :sex,
                                                         :spouse,
                                                         :child,
                                                         :number_of_occupants,
                                                         :budget_for_rent,
                                                         :budget_for_buy,
                                                         :status
                                                        ])
    end
end
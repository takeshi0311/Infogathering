class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def after_sign_out_path_for(resource)
      # after_sign_out_path_for:deviseでサインアウトしたあとのリダイレクト先を指定するメソッド
      '/users/sign_in' # サインアウト後のリダイレクト先URL
    end
end

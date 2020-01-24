class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource)
    # after_sign_out_path_for:deviseでサインアウトしたあとのリダイレクト先を指定するメソッド
    '/users/sign_in' # サインアウト後のリダイレクト先URL
  end
end

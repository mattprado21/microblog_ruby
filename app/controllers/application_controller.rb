class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :redirect_to_back_or_default

    def after_sign_out_path_for(*)
        new_user_session_path
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :birthdate, :bio, :email, :password, :current_password)}
    end
end

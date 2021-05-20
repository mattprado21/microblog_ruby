class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method :redirect_to_back_or_default

    def after_sign_out_path_for(*)
        new_user_session_path
    end
end

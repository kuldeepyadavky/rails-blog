class ApplicationController < ActionController::Base
    #if controller is devise, configure permitted parameters in application controller
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected #for change or more updation of configure permits
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u|
            u.permit(:username, :email, :password) 
        }
    end
end

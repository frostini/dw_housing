class RegistrationController < Devise::RegistrationsController
before_filter :configure_permitted_parameters, :only => [:create]
skip_before_filter :verify_authenticity_token, :only => :create

def create

  user_klass = get_user_klass
  @user = user_klass.new(registration_params)
    if @user.save
      sign_in @user
      redirect_to root_path
      flash[:success] = "Welcome to DwellWell Housing!"
    else
      flash[:error] = "Something went wrong!"
    end

end





private
	def get_user_klass
		registration_params[:user_type].constantize
	end
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :user_type) }
	end
	def registration_params
		params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
	end
end
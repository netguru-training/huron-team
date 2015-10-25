class Users::RegistrationsController < Devise::RegistrationsController

  #before_filter :configure_permitted_parameters

  def create
    super
    role = params[:user][:is_geek] == '1' ? :beer_geek : :bar_owner
    @user.add_role role
    @user.save
  end


#  def configure_permitted_parameters
#    devise_parameter_sanitizer.for(:sign_up) do |u|
#      u.permit(:name, :email, :password, :password_confirmation, :role)
#    end
#  end

end

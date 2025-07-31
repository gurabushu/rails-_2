class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :profile, :img])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile, :img])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_up_path_for(resource)
    session.delete(:return_to) || super
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    unless user_signed_in?
      session[:return_to] = request.fullpath
    end
  end
end


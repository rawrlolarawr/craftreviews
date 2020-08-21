class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_alls!

  def set_alls!
    @breweries = Brewery.all
    @beers = Beer.all
    @reviews = Review.all
  end

  def set_flash(type, message)
    flash[type] = message
  end

  def flash_error(model)
    flash[:error] = model.errors.full_messages
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end

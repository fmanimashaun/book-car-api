class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render json: {
      status: {
        code: 403,
        message: 'Forbidden'
      },
      error: exception.message
    }, status: :forbidden
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username email])
  end
end

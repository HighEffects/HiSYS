class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource
  
  before_filter :set_locale
  
  if Rails.env.production?
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end
  
  def after_sign_in_path_for(resource)
   pages_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    pages_path
  end
  
  def mixpanel
    if Rails.env.production?
      @mixpanel ||= Mixpanel::Tracker.new 'd38d373a7a4f4123c13df2c610e2acbb', { :env => request.env }
    end
  end

  private
  
  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: "layout-contact", status: status }
      format.all { render nothing: true, status: status }
    end
  end

  def set_locale
    I18n.locale = 'pt-BR'
    # current_user.locale# request.subdomain# request.env["HTTP_ACCEPT_LANGUAGE"]# request.remote_ipenddefdefault_url_options(options = {})
    {locale:I18n.locale}
  end
  
  protected

  def layout_by_resource
    if devise_controller?
      "layout-user"
    else
      "application"
    end
  end
  
end

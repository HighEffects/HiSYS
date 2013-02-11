class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource
  
  before_filter :set_locale
  
  def mixpanel
    if Rails.env.production?
      @mixpanel ||= Mixpanel::Tracker.new 'd38d373a7a4f4123c13df2c610e2acbb', { :env => request.env }
    end
  end

  private

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

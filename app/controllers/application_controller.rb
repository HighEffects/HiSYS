class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource
  
  before_filter :set_locale

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

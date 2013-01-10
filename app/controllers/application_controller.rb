class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "layout-user"
    else
      "application"
    end
  end
end

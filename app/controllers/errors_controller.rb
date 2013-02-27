class ErrorsController < ApplicationController
  
   layout "layout-contact"
  
  def error_404
    @not_found_path = params[:status]
  end

  def error_500
  end
end
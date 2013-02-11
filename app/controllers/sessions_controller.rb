class SessionsController < Devise::SessionsController

  def create
    super
    mixpanel.track 'User login' if Rails.env.production?
  end

  def destroy
    super
  end
end
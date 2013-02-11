class SessionsController < Devise::SessionsController

  def create
    super
    if Rails.env.production?
      mixpanel.track 'User login' 
      username = current_user.first_name + " " + current_user.last_name
      mixpanel.set current_user.id, { :name => username, :email => current_user.email, :last_login => Time.now }
      mixpanel.increment current_user.id, { :logins => 1 }
    end
  end

  def destroy
    super
  end
end
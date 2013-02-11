class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if Rails.env.production?
       
      username = current_user.first_name + " " + current_user.last_name
      mixpanel.set current_user.id, { :name => username, :email => current_user.email}
      mixpanel.increment current_user.id, { :logins => 1 }
      mixpanel.track 'User Signup'
    end
  end

  def destroy
    super
  end
  
end
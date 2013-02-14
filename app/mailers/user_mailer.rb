class UserMailer < ActionMailer::Base
  
  def signup_confirmation(user)
      @user = user
      mail to: user.email, subject: "Bem vindo a High Effects", :from    => "contato@higheffects.com.br" 
    end
  
end
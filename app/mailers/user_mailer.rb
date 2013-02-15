class UserMailer < ActionMailer::Base
  
  def signup_confirmation(user)
      @user = user
      mail to: user.email, subject: "Bem vindo a High Effects", :from => "contato@higheffects.com.br" 
  end
  
  def support_message(message)
      @message = message
      mail to: "contato@higheffects.com.br", subject: message.title , :from =>  message.email 
  end
  
end
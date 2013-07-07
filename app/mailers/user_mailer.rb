class UserMailer < ActionMailer::Base
  
  def signup_confirmation(user)
      @user = user
      mail to: user.email, subject: "Bem vindo a High Effects", :from => "contato@higheffects.com.br" 
  end
  
  def support_message(message)
      @message = message
      mail to: "contato@higheffects.com.br", subject: message.title , :from =>  message.email 
  end
  
  def store_checkout(shopping_cart)
      @shopping_cart = shopping_cart
      subject = 'Compra #' + @shopping_cart.id.to_s + ' - High Effects'
      mail to: @shopping_cart.user.email, subject: subject , :from => "contato@higheffects.com.br"
  end
  
  def store_checkout_alert(shopping_cart, admins)
      @admins = admins
      @admins.each do |admin|
        @shopping_cart = shopping_cart
        subject = 'Alerta - Compra #' + @shopping_cart.id.to_s
        mail to: admin.email, subject: subject , :from => "contato@higheffects.com.br"
      end
  end
  
end
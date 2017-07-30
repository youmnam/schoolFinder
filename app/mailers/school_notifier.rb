class SchoolNotifier < ApplicationMailer


  
  
  default :from => 'abdo.hassan.fci@gmail.com'

   layout "mailer"
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email
    
    mail( :to => "abdo.hassan.fci@gmail.com",
    :subject => 'Thanks for signing up for our amazing app' )
  end
  

end

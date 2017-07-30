class UserMailer < ApplicationMailer

  
  
  
  
  
  def vacancy_addmission_email(email_body , school_email )
  

  
  #{
	#"search_school":{  
       #  "parent_name":"Abdelrahman mohamed",
      #   "email":"youmna.mahmoed@gmail.com",
     #    "telephone_no":"012345678",
    #     "kid_name":"mohamed",
   #      "grade":"3",
  #       "school_id" :5
 #    }
#}
  
	 
	# file_data = File.binread('C:/Users/BO0dy/Desktop/RoboticArm-Session2-Activities.pdf')
     
	 #attachments['Employee_CV'] = { :mime_type => 'application/x-pdf',
      #                              :content => file_data }
	 
	 
    mail( :to => ""+school_email+"", :subject => "From Uniparticle" ,
	:body => "
	Parent Name : "+email_body[:parent_name]+"
	Email : "+email_body[:email]+" 
	Telephone No : "+email_body[:telephone_no]+"
	Kid Name : "+email_body[:kid_name]+"
	Grade : "+email_body[:grade]+"
	" 
	
	
	)
 
#   
  end
  
  
  
  
  
  #{
	#"addmission_details":{  
       #  "employee_name":"Youmna Magdy",
      #   "email":"youmna.mahmoed@gmail.com",
     #    "telephone_no":"012345678",
    #     "position":"TA",
   #      "cv_path":"C:/Users/BO0dy/Desktop/RoboticArm-Session2-Activities.pdf",
  #       "school_id" :5
 #    }
#}


   def job_addmission_email(email_body , school_email )
     
	 
	 file_data = File.binread(""+email_body[:cv_path]+"")
     
	 attachments['Employee_CV'] = { :mime_type => 'application/x-pdf',
                                   :content => file_data }
	 
	 
	# 
	 
    mail( :to => ""+school_email+"", :subject => "From Uniparticle" ,
	:body => "
	Employee Name : "+email_body[:employee_name]+"
	Email : "+email_body[:email]+" 
	Telephone No : "+email_body[:telephone_no]+"
	Position : "+email_body[:position]+"
	
	" 
	
	
	)
 
#   
  end
  
  

end



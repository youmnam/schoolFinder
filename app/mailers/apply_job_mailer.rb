class ApplyJobMailer < ApplicationMailer
default from: "magdy.youmna@gmail.com"


def send_job(apply_params,id)

file_data = File.binread(""+apply_params[:cv_path].path+"")
     
	 attachments['Employee_CV'] = { :mime_type => 'application/x-pdf',
                                   :content => file_data }


@school = School.find(id)
    mail(to: @school.school_email , subject: "#{@school.school_name} New Job Application" ,
    :body => "
    Employee Name : "+apply_params[:employee_name]+"
	Email : "+apply_params[:email]+" 
	Telephone No : "+apply_params[:telephone_no]+"
    Position : "+apply_params[:position]+"
    "
    )
end    
end
class Api::V1::JobVacancyController < ApplicationController

skip_before_action :verify_authenticity_token

    def search_for_vacancy
		@job_vacancy = JobVacancy.search(params[:job_vacancy][:title])
		render json: @job_vacancy
	end
    
    def add_job_vacancy 
      @job_vacancy = JobVacancy.new(job_vacancies_param)
        if @job_vacancy.save
          render json: @job_vacancy, status: :created
        else
          render json: @job_vacancy.errors, status: :unprocessable_entity
        end         
    end
    
	def get_job_vacancy_details
	  @job_vacancy = JobVacancy.find(params[:id])
	  render json: @job_vacancy
	end

  def job_addmission
  
     $email = School.select("school_email").where("id = " + params[:addmission_details][:school_id].to_s )
    #puts $school_email
    UserMailer.job_addmission_email(params[:addmission_details] , $email[0]["school_email"]).deliver   
    @school = School.all
      render json: @school
  
  end

	private

	def job_vacancies_param
      params.require(:job_vacancy).permit(:title, :description, :opened_at, :school_id, :school_name, :qualifications) 
    end	
    

end
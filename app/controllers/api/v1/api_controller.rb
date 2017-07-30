class Api::V1::ApiController < ApplicationController


skip_before_action :verify_authenticity_token
	#get all cateogries listed registerd at the system
	def getAllSchools
	 	@Schools = School.all	 	
	 	render json: @Schools
	end
	
  def getTopRatingSchools
    @Schools = School.select("Distinct Schools.*").joins(' , "ratings" where "Schools"."id" = "ratings"."school_id" and ("ratings".rate1+"ratings".rate2+"ratings".rate3+ "ratings".rate4)/4.0 > ' + params[:id])
    render json: @Schools.to_json
    
  end
  
	def index
	  @Schools = School.all 	
    render json: @Schools
  end
	
	
def add_new_school
  @school = School.new(school_params)
    if @school.save
    render json: @school, status: :created
    else
    render json: @school.errors
  end	
end
  
  
  def Search_school
	 @school = School.find_school(params[:search_school])
	 
     render json: @school
  end
  
  
  private
    def school_params
      params.require(:school).permit(:school_name, :school_description,
            :school_city,
            :school_area,
            :school_curriculum,
            :school_certificate,
            :school_eduSystem,
            :school_foreignTeachers,
            :school_feesRange,
            :school_availableGrades,
            :school_age,
            :school_website,
            :school_telephone,
            :school_email,
            :school_app,
            :school_address,
            :admission_status,
            :admission_email,
            :school_cafeteria,
            :school_soccerPlayground,
            :school_InnovationSpaces,
            :school_theater,
             :school_computerLabs,
             :school_scienceLab,
             :school_library,
             :school_swimmingPool,
             :school_logo,
             :school_images 
)
    end

end

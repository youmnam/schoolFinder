class Api::V1::TutorController < ApplicationController

  skip_before_action :verify_authenticity_token

  	def add_tutor_postion
      @tutor_postion = Tutor.new(tutor_params)
        if @tutor_postion.save
          render json: @tutor_postion, status: :created
        else
          render json: @tutor_postion.errors, status: :unprocessable_entity
        end         
    end

    def getAllTutor 
      @Tutors = Tutor.all   
      render json: @Tutors
    end
    
    def tutor_params
      params.require(:tutor).permit(:first_name,:last_name,
      :email,
      :phone,
      :description,
      :current_job,
      :qualifications) 
    end	
end

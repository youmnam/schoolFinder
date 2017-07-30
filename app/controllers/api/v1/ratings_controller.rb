class Api::V1::RatingsController < ApplicationController


skip_before_action :verify_authenticity_token
	#get all cateogries listed registerd at the system
	def getSchoolRating
	
		
		@Ratings  = Rating.select('(sum(rate1+rate2+rate3+rate4))/4.0 as Total_Rating').where("school_id = "+params[:School_id]+"").group("school_id")
		render json: @Ratings.to_json
	 	#head :no_content
	end
	
	def getSchoolDetailsRating

		@Ratings  = Rating.select('(sum(rate1)/4.0) total1 , (sum(rate2)/4.0) total2 , (sum(rate3)/4.0) total3 , (sum(rate4)/4.0) total4 ').where("school_id = "+params[:id]+"").group("school_id")
		render json: @Ratings[0].to_json
	 	#head :no_content
	end
	
	def getSchoolRatingMessages

		@Ratings  = Rating.where("school_id = "+params[:id]+"")
		render json: @Ratings.to_json
	 	#head :no_content
	end
	
	
	def add_school_rating
  @schoolRating = Rating.new(school_rating)
    if @schoolRating.save
    render json: @schoolRating, status: :created
    else
    render json: @schoolRating.errors
  end	
end
	
	
	
  private
    def school_rating
	
      params.require(:school_rating).permit(:rate1, :rate2,:rate3,:rate4,:school_id,:username, :email, :comment)
    end

end

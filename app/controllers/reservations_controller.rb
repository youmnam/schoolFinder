class ReservationsController < ApplicationController
	before_action :require_user, only: [:changeStatus]

	def changeStatus
		@res = Reservation.find(params[:id])
        @res.update(:status => params[:status])
        redirect_to user_path(:id => params[:user_id])
	end
	

	def create		
	 	@Reservation = Reservation.new(reserv_params)	  	
	  	if @Reservation.save
      		flash[:notice] = "Successfully Requested!"
      		redirect_to viewitem_path(:id => params[:id])
    	else
      		render :action => 'new'
    	end
	end

private
	  def reserv_params
	    params.require(:reservation).permit(:name,:email,:from,:to, :item_id,:status)
	  end

end

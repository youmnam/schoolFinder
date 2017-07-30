class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(allowed_params)

            if @user.save 
                redirect_to schools_path, notice: 'Thank you for signing up!'
            else 
                render :new
            end
    
    end



private 

    def allowed_params 
        params.require(:user).permit(:email,  :password, :password_confirmation ,:password_digest)
    end 

end
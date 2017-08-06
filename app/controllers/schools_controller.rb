class SchoolsController < ApplicationController
  
  #before_action :set_school
  before_action :authorize, only: [:index, :show, :edit, :update, :destroy]
  before_action :authorize, except: [:create ,:new]
  
  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
    render :index
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = School.find(params[:id])
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html {render :success }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
def update
    @school = School.find(params[:id])
  if school_params[:school_images].present?
    puts "Hellllloooooo"
    add_more_images(school_params[:school_images])    
    flash[:error] = "Failed uploading images" unless @school.save
    respond_to do |format|
      if @school.update(update_params)
        format.html { redirect_to  edit_school_url(params[:id]) ,notice: "#{@school.school_name} New Images Was Added." }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end  
end

  def approve
    
    @school = School.find(params[:id])
    respond_to do |format|
    
      if  SchoolTokenMailer.send_token(@school).deliver_now && @school.update_attribute(:status,true)
       if @school.update_attribute(:expire,DateTime.now + 30.days) 
        format.html { redirect_to schools_url, notice: "#{@school.school_name} Was Successfully approved." }
        format.json { head :no_content }
       end

    else  
       
        if @school.status == false 
          format.html {  redirect_to schools_url, notice: "#{@school.school_name} Was not approved." }
          format.json { render json: @school.errors, status: :unprocessable_entity }
        end

        if @school.status == true 
          format.html{ redirect_to schools_url, notice: "#{@school.school_name} Was Successfully approved but no Email was sent." }
          format.json { render json: @school.errors, status: :unprocessable_entity }
        end
      
      end
    end
  end

def subscribe
   @school = School.find(params[:id])

    respond_to do |format|
  if @school.update_attribute(:expire,DateTime.now.to_date + params[:school][:expire].to_i.days) 
       format.html { redirect_to schools_url, notice: "#{@school.school_name} Was Successfully Renewed its Subscription." }
        format.json { head :no_content }
        #@school.save
   else 
       format.html {  redirect_to schools_url, notice: "#{@school.school_name} Subscription was not renewed ." }
          format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end   

end 

def apply
school = School.find(params[:id])
end

def applyjob 
  
@school = School.find(params[:id])
@email = @school.school_email

if   ApplyJobMailer.send_job(apply_params,@school.id.to_i).deliver 
  redirect_to applyview_url(params[:id]) ,notice: "Your Application has been sent!"
else 
  redirect_to applyview_url(params[:id]) ,notice: "Your Application hasn't been sent!"
end
end






  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_school
     # @school = School.find(params[:id])
    #end


  def add_more_images(new_images)
    images = @school.school_images 
    images += new_images
    @school.school_images = images
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:school_name, :school_description, :school_eduSystem,  :school_city, :school_area, :school_curriculum, :school_foreignTeachers, :school_feesRange, :school_availableGrades, :school_age, :school_website, :school_telephone, :school_email, :school_app, :school_address, :admission_status, :admission_email, :school_cafeteria, :school_soccerPlayground, :school_InnovationSpaces, :school_theater, :school_computerLabs, :school_scienceLab, :school_library, :school_swimmingPool,:school_logo,school_images: [])
    end

    def update_params
      params.require(:school).permit(:school_name, :school_description, :school_eduSystem,  :school_city, :school_area, :school_curriculum, :school_foreignTeachers, :school_feesRange, :school_availableGrades, :school_age, :school_website, :school_telephone, :school_email, :school_app, :school_address, :admission_status, :admission_email, :school_cafeteria, :school_soccerPlayground, :school_InnovationSpaces, :school_theater, :school_computerLabs, :school_scienceLab, :school_library, :school_swimmingPool,:school_logo)
    end
   
    def apply_params
      params.permit(:employee_name,:email,:telephone_no,:position,:cv_path,:id) 
    end
    
end

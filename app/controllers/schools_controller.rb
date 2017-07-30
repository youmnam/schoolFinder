class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
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
        format.html { redirect_to @school, notice: 'School was successfully created.' }
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
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    
    @school = School.find(params[:id])
    respond_to do |format|
    
      if  SchoolTokenMailer.send_token(@school).deliver_now && @school.update_attribute(:status,true)
      
        format.html { redirect_to schools_url, notice: "#{@school.school_name} Was Successfully approved." }
        format.json { head :no_content }
    

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
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:school_name, :school_description, :school_eduSystem,  :school_city, :school_area, :school_curriculum, :school_foreignTeachers, :school_feesRange, :school_availableGrades, :school_age, :school_website, :school_telephone, :school_email, :school_app, :school_address, :admission_status, :admission_email, :school_cafeteria, :school_soccerPlayground, :school_InnovationSpaces, :school_theater, :school_computerLabs, :school_scienceLab, :school_library, :school_swimmingPool,:school_logo,school_images: [])
    end
end

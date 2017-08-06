class ImagesController < ApplicationController
  before_action :set_school
  skip_before_action :verify_authenticity_token
  def create
    if  !params[:school].present? 
        flash[:error] = "Failed uploading images"
        redirect_to  edit_school_url(params[:school_id]) ,notice: "#{@school.school_name} No Images was Uploaded or Updated." 
    else     
        add_more_images(images_params[:school_images])
        flash[:error] = "Failed uploading images" unless @school.save
        redirect_to  edit_school_url(params[:school_id]) ,notice: "#{@school.school_name} New Images Was Added." 
    end

end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @school.save
    #render :edit
     puts "#{@school.school_images}"
    redirect_to  edit_school_url(params[:school_id])
  end

  private

  def set_school
      @school = School.find(params[:school_id])
    end

  def add_more_images(new_images)
    images = @school.school_images 
    images += new_images
    @school.school_images = images
  end

  def remove_image_at_index(index)
    remain_images = @school.school_images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @school.update_attribute(:school_images,@school.school_images)
  end

  def images_params
    params.require(:school).permit({school_images: []}) # allow nested params as array
  end
end
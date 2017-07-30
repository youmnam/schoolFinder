class School < ApplicationRecord
    mount_uploader :school_logo, ImageUploader
    mount_uploaders :school_images, ImageUploader

	before_validation :token_create  , on: :create
	validates_uniqueness_of :token ,on: :create
	private 

	def token_create

	self.token = loop do
	      random_token = SecureRandom.base58(7).downcase
	      break random_token unless School.exists?(token: random_token)
	    end
	end


#educational approach : [0] Internaional [1] American , [2] British , [3]French, [4]Deutsche, [5]Candian
def self.find_school( searchCrieria )
 
 $query = " 1 = 1 "
 
 if searchCrieria[:educational_approach] != "" && searchCrieria[:educational_approach] != " '' " 
 		$query += " AND  \"school_eduSystem\" in " + "("+ searchCrieria[:educational_approach] +") "
 end

 if searchCrieria[:area] != "" && searchCrieria[:area] != " '' "
    $query += " AND  school_area in " + "("+searchCrieria[:area]+")"
 end
 
 if searchCrieria[:grades_availabilty] != "" && searchCrieria[:grades_availabilty] != " '' "
    $query += " AND  \"school_availableGrades\" in " + " (#{searchCrieria[:grades_availabilty]}) "
 end

 if searchCrieria[:amissionStatus] != "" 
    $query += " AND  \"admission_status\"  = " + "'#{searchCrieria[:amissionStatus]}'"
 end


   
  $query  += " AND \"school_feesRange\" " + " BETWEEN  " + "'#{searchCrieria[:FFees]}'" +" AND " + "'#{searchCrieria[:TFees]}'"
  
  where($query)
 
 end

end

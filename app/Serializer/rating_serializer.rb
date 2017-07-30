class RatingSerializer < ActiveModel::Serializer
  attributes  :rate1,:rate2,:rate3,
       :rate4,
	   :school_id,
	   :username,
	   :email,
	   :comment
	end
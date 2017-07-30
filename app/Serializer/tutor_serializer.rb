class TutorSerializer < ActiveModel::Serializer
  attributes    :first_name,:last_name,
      :email,
      :phone,
      :description,
      :current_job,
      :qualifications
	end
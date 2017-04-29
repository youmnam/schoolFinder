class UserSerializer < ActiveModel::Serializer
  attributes :usr_vname, :usr_email,:usr_tel, :usr_address, :usr_gover, :usr_city, :usr_logo, :usr_delivery, :usr_description
end
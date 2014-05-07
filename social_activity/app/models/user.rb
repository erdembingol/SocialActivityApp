class User < ActiveRecord::Base
	attr_accessible :name,
					:lastname,
					:birth_date,
					:gender,
					:adress,
					:profil_image,
					:password
end

class Comment < ActiveRecord::Base
	atrr_accessible :body,
					:user_id,
					:user_profil_image
end

class Friend < ActiveRecord::Base
	atrr_accessible :user_id,
					:friend_id
end

class Image < ActiveRecord::Base
	attr_accessible :adress,
					:is_user_or_activity,
					:belong_id
end

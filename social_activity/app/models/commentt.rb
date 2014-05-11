class Commentt < ActiveRecord::Base
	attr_accessible :user_id, :activity_id, :body
end

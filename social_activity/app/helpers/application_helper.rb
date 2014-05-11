module ApplicationHelper

	def set_activity_id id_param
		@@activity_id_now = id_param
	end

	def get_activity_id
		@@activity_id_now
	end	
end

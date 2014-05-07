class Activity < ActiveRecord::Base
	attr_accessible :name, :place_name, :place_adress, :start_date, :finish_date, :paid, :age_group, :gender, :explain
end

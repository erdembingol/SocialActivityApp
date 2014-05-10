class MainpageController < ApplicationController
	def index
		@activities = Activity.take(5);
	end
end

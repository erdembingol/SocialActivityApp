class ActivitySaveController < ApplicationController
	def index
		@activity = Activity.new
	end

	def show

	end

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(params[:activity]);

		if @activity.save
			redirect_to activities_path, :notice => "Activity was saved"
		else
			render "new"
		end		
	end

	def edit

	end

	def update

	end

	def destroy

	end
end

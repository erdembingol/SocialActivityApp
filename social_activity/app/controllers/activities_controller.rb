class ActivitiesController < ApplicationController
	def index
		@activities = Activity.find_by_sql "select u.image, a.* from activity_images u, activities a 
						where u.activity_id == a.id"
	end

	def show
		@activity = Activity.find(params[:id])
		@activity_image = ActivityImage.find_by_activity_id(params[:id])
		@commentts = Comment.find_by_sql "select ui.image, c.body from user_images ui, users u, commentts c"
	 	#@commentts = Commentt.find_by_sql "select ui.image, c.body from user_images ui, users u, commentts c
	 			#where c.activity_id == 'params[:id]' and c.user_id == ui.user_id"			
	end

	def new
		@activity = Activity.new
	end

	#def do_comment
		#@commentt = Commentt.new(session[:current_user_id], params[:body])
		#@commentt.save
		#render "show"
		#end	
	#end	

	def create
		@activity = Activity.new(params[:activity])
    	if @activity.save
    		flash[:notice] = "Activity was saved"
        	flash[:color]= "valid"
      	else
        	flash[:notice] = "Activity was not saved"
        	flash[:color]= "invalid"
      	end
      	@activity = Activity.last
      	@image = ActivityImage.new
      	@image.activity_id = @activity.id 
      	@image.image = params[:activity][:image1].original_filename.to_s
		@image.save

		File.open(Rails.root.join('app/assets', 'images', params[:activity][:image1].original_filename), 'wb') do |f| f.write(params[:activity][:image1].read) end

      	render "new"		
	end

	def edit

	end

	def update

	end

	def destroy

	end
end

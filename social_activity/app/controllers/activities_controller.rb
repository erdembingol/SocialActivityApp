class ActivitiesController < ApplicationController
	@@now_activity_id = 0
	def index
		@activities = Activity.find_by_sql "select u.image, a.* from activity_images u, activities a 
						where u.activity_id == a.id"
	end

	def show
		session[:activity_id] = params[:id]
		@@now_activity_id = params[:id]
		#set_activity_id(params[:id])############################################
		@activity = Activity.find(params[:id])
		@activity_image = ActivityImage.find_by_activity_id(params[:id])
		@commentts = Comment.find_by_sql "select ui.image, c.body from user_images ui, users u, commentts c"
	 	#@commentts = Commentt.find_by_sql "select ui.image, c.body from user_images ui, users u, commentts c
	 			#where c.activity_id == 'params[:id]' and c.user_id == ui.user_id"			
		############################
	end

	def new
		@activity = Activity.new
	end

	def join
		@user = User.find(session[:user_id])
		@activity = Activity.find(session[:activity_id])

		@today = Date.today
		@birth_date = @user.birth_date
		@diff = (@today - @birth_date)/365

		@joined_think_activities = JoinedThinkActivity.find_by_activity_id(session[:activity_id])
		@joined_activities = JoinedActivity.find_by_activity_id(session[:activity_id]) 

		if @joined_think_activities == nil and @joined_activities == nil
			if @activity.age_group.to_s.eql? "0-7"
				if @activity.gender.to_s.eql? @user.gender.to_s or @activity.gender.to_s.eql? "Hepsi"
					if @diff >= 0 && @diff <= 7
						@joined_think_activity = JoinedThinkActivity.new(:user_id => session[:user_id], :activity_id => session[:activity_id])#######################
						@joined_think_activity.save		
						flash[:notice] = "Activity was added..."	
					else
						flash[:notice] = "Activity was not added!!!!"	
					end
				end	
			end
			if @activity.age_group.to_s.eql? "8-14"
				if @activity.gender.to_s.eql? @user.gender.to_s or @activity.gender.to_s.eql? "Hepsi"
					if @diff >= 8 && @diff <= 14
						@joined_think_activity = JoinedThinkActivity.new(:user_id => session[:user_id], :activity_id => session[:activity_id])#######################
						@joined_think_activity.save		
						flash[:notice] = "Activity was added..."	
					else
						flash[:notice] = "Activity was not added!!!!"	
					end
				end	
			end
			if @activity.age_group.to_s.eql? "15-20"
				if @activity.gender.to_s.eql? @user.gender.to_s or @activity.gender.to_s.eql? "Hepsi"
					if @diff >= 15 && @diff <= 20
						@joined_think_activity = JoinedThinkActivity.new(:user_id => session[:user_id], :activity_id => session[:activity_id])#######################
						@joined_think_activity.save		
						flash[:notice] = "Activity was added..."	
					else
						flash[:notice] = "Activity was not added!!!!"	
					end
				end	
			end
			if @activity.age_group.to_s.eql? "21-50"
				if @activity.gender.to_s.eql? @user.gender.to_s or @activity.gender.to_s.eql? "Hepsi"
					if @diff >= 21 && @diff <= 50
						@joined_think_activity = JoinedThinkActivity.new(:user_id => session[:user_id], :activity_id => session[:activity_id])#######################
						@joined_think_activity.save		
						flash[:notice] = "Activity was added..."	
					else
						flash[:notice] = "Activity was not added!!!!"	
					end
				end	
			end
			if @activity.age_group.to_s.eql? "51-70"
				if @activity.gender.to_s.eql? @user.gender.to_s or @activity.gender.to_s.eql? "Hepsi"
					if @diff >= 51 && @diff <= 70
						@joined_think_activity = JoinedThinkActivity.new(:user_id => session[:user_id], :activity_id => session[:activity_id])#######################
						@joined_think_activity.save		
						flash[:notice] = "Activity was added..."	
					else
						flash[:notice] = "Activity was not added!!!!"	
					end
				end	
			end
		else
			flash[:notice] = "Bu activite zaten listenizde mevcut"	
		end

		#redirect_to :action => 'activities'
		#@joined_think_activity = JoinedThinkActivity.new(:user_id => session[:user_id], :activity_id => @@now_activity_id)#######################
		#@joined_think_activity.save
	end 

	#def do_comment
		#@commentt = Commentt.new(session[:current_user_id], params[:body])
		#@commentt.save
		#render "show"
		#end	
	#end	

	def create
		@user = User.find(session[:user_id])
		if @user.password.to_s.eql? session[:admin_password].to_s
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

	      	#render "new"
	    #else
	    	#flash[:notice] = "Etkinlik oluşturma yetkiniz yok!!!"
	    	#flash[:color]= "invalid"
	    	#render "new"
	    end
	    render "new"	  			
	end

	def edit

	end

	def update

	end

	def destroy

	end
end

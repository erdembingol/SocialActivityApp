class SessionsController < ApplicationController

	before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def index
		#@authorized_user = User.new
	end 

	def home
		@activities = Activity.find_by_sql "select u.image, a.* from activity_images u, activities a 
						where u.activity_id == a.id ORDER BY a.id DESC LIMIT 5"
	end

	def profile
		@user = User.find(session[:user_id])

		@today = Date.today
		#@finish_date = @activity.finish_date

		############################################
		@activities = Activity.find_by_sql "select a.* from activities a, joined_think_activities jta where 
			a.id == jta.activity_id"

		@activities.each do |act|
			@diff_date = (@today - act.finish_date)
			if @diff_date > 0
				@activity = JoinedActivity.new(:user_id => session[:user_id], :activity_id => act.id)
				@activity.save
				JoinedThinkActivity.find_by_activity_id(act.id).destroy
			end	
		end	
		############################################	
		@joined_activities = Activity.find_by_sql "select ai.image, a.* from activity_images ai, activities a, 
			joined_activities ja where ja.user_id == '#{session[:user_id]}' and ja.activity_id == a.id and ai.activity_id == a.id "
		@joined_activities_size = @joined_activities.size

		@joined_think_activities = Activity.find_by_sql "select ai.image, a.* from activity_images ai, activities a, 
			joined_think_activities ja where ja.user_id == '#{session[:user_id]}' and ja.activity_id == a.id and ai.activity_id == a.id"
		@joined_think_activities_size = @joined_think_activities.size

		#@last_joined_activities = JoinedActivity.find_by_sql "select ai.image, a.* from activity_images ai, activities a, 
			#{}joined_activities ja where ja.user_id == 'session[:user_id]' and ja.activity_id == a.id ORDER BY a.id DESC LIMIT 1"
		#@user_image = UserImage.find_by_user_id(session[:user_id])
	end

	#def join
	#	@joined_think_activity = JoinedThinkActivity.new(:user_id => session[:user_id], :activity_id => get_activity_id)#######################
	#	@joined_think_activity.save
	#end 

	def setting
		#Setting Page
		#@activity = Activity.new
		#redirect_to(:action => 'activity_save#index')
	end

	def create
		#@activity = Activity.new(params[:activity]);

		#if @activity.save
		#	 flash[:notice] = "Activity was saved"
		#	 redirect_to(:action => 'setting')
		#else
		#	render "setting"
		#end	
	end	

	def login
		#Login Form
		#@authorized_user = User.new
	end

	def login_attempt
		@authorized_user = User.authenticate(params[:username], params[:userlastname], params[:login_password])
		if @authorized_user
			session[:user_id] = @authorized_user.id
			flash[:notice] = "Welcome again, you logged in #{@authorized_user.password}"
			session[:admin_password] = "admin_123"########################
			redirect_to(:action => 'home')
		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:user_id] = nil
		session[:activity_id] = nil
		redirect_to :action => 'login'
	end
end

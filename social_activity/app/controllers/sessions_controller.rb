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
		#@user_image = UserImage.find_by_user_id(session[:user_id])
	end

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
			redirect_to(:action => 'home')
		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end
end

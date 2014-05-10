class UserSaveController < ApplicationController
	def index
		@user = User.new
	end

	def show

	end

	def new

	end

	def create
		@user = User.new(params[:user]);

		if @user.save
			redirect_to activities_path, :notice => "User was saved"
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

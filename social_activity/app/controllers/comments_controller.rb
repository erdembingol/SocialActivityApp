class CommentsController < ApplicationController
	def show
		@activity = Activity.find(params[:id])
		@activity_image = ActivityImage.find_by_activity_id(params[:id])
		@comments = Comment.find_by_sql "select ui.image, u.name, u.lastname, c.body from user_images ui, users u, comments c
	 				where ui.user_id == u.id and ui.user_id == c.user_id"

		@comment = Comment.new(session[:current_user_id], params[:body])
		@comment.save
			render "show"
		#end	
	end	
end

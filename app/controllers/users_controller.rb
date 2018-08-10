class UsersController < ApplicationController
	def new
  @user = User.new(params[:user])
end

	def index
		@users = User.all
	end
	def destroy
      
	  @user = User.find_by(id: params[:id])
	  @user.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to "/friendships/frnd"
	end
	
	
end

class FriendshipsController < ApplicationController
  
 def create
	  @friendship = current_user.friendships.build(friend_id: params[:friend_id])
	  if @friendship.save
	    flash[:notice] = "Friend requested."
	    redirect_to "/friendships/frnd"
	  else
	    flash[:error] = "Unable to request friendship."
	    redirect_to "/friendships/frnd"
	  end
	end

	def update
       
	@friendship = Friendship.find_by(id: params[:id])
	@friendship.update(accepted: true)
	  if @friendship.save
	    redirect_to root_url, notice: "Successfully confirmed friend!"
	  else
	    redirect_to root_url, notice: "Sorry! Could not confirm friend!"
	  end
	end

	def destroy

	  @friendship = Friendship.find_by(id: params[:id])
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to "/friendships/frnd"
	end

	def frnd
		@users = User.all_except(current_user)

		if params[:search]
			@users = User.search(params[:search]).order("created_at DESC")
		else
			@users = User.all.order("created_at DESC")
		end
	end
	def myfrnd
		user=current_user
		@users=user.friends
	end
	
end

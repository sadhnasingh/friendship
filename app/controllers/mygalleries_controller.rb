class MygalleriesController < ApplicationController
	def friendgallery
   
    @mygallery = Mygallery.find_by(params[:user_id])
	end
    
  def create_gallery
  	@images = params[:image]
  	@images.each do |image|
    	@mygallery = Mygallery.create(image: image, user_id: params[:user_id])
    end	
  	if @mygallery
  		redirect_to mygalleries_gallery_path
  	end
  end

  def permit_mygallery	
    params.require(:mygallery).permit(:image, :user_id)
  end 	
  

end

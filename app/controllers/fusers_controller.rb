class FusersController < ApplicationController
	def index
    @fusers = Fuser.all
  end
 
  def show
    @fuser = Fuser.find(params[:id])
  end
 
	def new
  @fuser = Fuser.new
  end
  def edit
  @fuser = Fuser.find(params[:id])
  end
 
  def create
  @fuser = Fuser.new(fuser_params)
 
  if @fuser.save!
    redirect_to @fuser
  else
    render 'new'
  end
  end
# # def update
# #   @fuser = Fuser.find(params[:id])
 
# #   if @fuser.update(fuser_params)
# #     redirect_to @fuser
# #   else
# #     render 'edit'
# #   end
# end
def destroy
    @fuser = Fuser.find(params[:id])
    @fuser.destroy
 
    redirect_to fusers_path
  end
 
private
  def fuser_params
    params.require(:fuser).permit(:image, :name, :about)
  end
end
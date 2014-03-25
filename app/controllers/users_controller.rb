class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id]) 
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	if @user.destroy
  		flash[:notice] = "User #{@user.fname} #{@user.lname} deleted successfully!"
  	else
  		flash[:alert] = "there was a problem destroying #{@user.fname}"
  	end
  	redirect_to "/users"
  end
end

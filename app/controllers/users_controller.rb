class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id]) 
  end

  def destroy
  	@user = User.where(id: params[:id]).first#.destroy
  	if @user && @user.destroy
  		flash[:notice] = "User #{@user.fname} #{@user.lname} deleted successfully!"
  	else
  		flash[:alert] = "there was a problem destroying #{@user.fname}"
  	end
  	redirect_to root_path
  end

  def new # enter in the new info in a form 
    @user = User.new
  end 

  def create #process data and actual create a new record, 
    @user = User.new(user_params) # create a new instance of user  
    
    if @user.save
      flash[:notice] = "Your account was created
      successfully."
      redirect_to root_path 
    else
      flash[:alert] = "There was a problem saving your
      account."
      redirect_to new_user_path
    end
  end 

  def edit # enter in the new info in a form 
    @user = User.find(params[:id]) 
  end

  def update  #process data and update user record 
    @user = User.where(id: params[:id]).first #REMEMBER   .where returns an array we want the .first one even if there is only one
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your account was updated
      successfully."
      redirect_to user_path(@user) 
    else
      flash[:alert] = "There was a problem saving your
      account."
      redirect_to new_user_path #or :back to go back to where u just came from 
    end
  end

  private
    def user_params
      params.require(:user).permit(:fname, :lname, :email)
  end

end









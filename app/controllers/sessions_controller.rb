class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
			flash[:notice] = "you are logged in"
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:alert] = "there was a problem"
			redirect_to root_path

		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "you were logged out"
		redirect_to root_path
	end
end

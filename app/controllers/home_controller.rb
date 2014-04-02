class HomeController < ApplicationController
	
	def search
		@users = User.where(fname: params[:query])
	end
end
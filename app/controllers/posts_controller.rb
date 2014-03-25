class PostsController < ApplicationController
  def index
  	@posts = User.find(params[:user_id]).posts
  	#@post = @user.posts.find()
  end

  def show
  end

  def destroy
  end
end

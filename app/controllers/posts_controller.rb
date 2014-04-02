class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  	# @posts = Post.where(user_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id]) #Couldn't find Post with id=post_id
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post #{@post.title} deleted successfully!"
      redirect_to user_posts_path(@post.user)
    else
      flash[:alert] = "there was a problem destroying #{@post.title}"
      redirect_to :back
    end  
  end

  def new 
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create #process data and actual create a new record 
    @post = Post.new(forum_params)
    @post.user_id = params[:user_id] #Associate post to a specific user 
    if @post.save
      flash[:notice] = "Your Post was created
      successfully."
      redirect_to user_posts_path(@post.user, @post) #Instant of User and of the post 
    else
      flash[:alert] = "There was a problem saving your
      Post."
      redirect_to new_user_post_path(@post.user)
    end
  end 

  def edit # enter in the new info in a form 
    @post = Post.find(params[:id]) #Can infer user 
  end

  def update  #process data and update user record 
    @post = Post.find(params[:id]) #REMEMBER   .where returns an array we want the .first one even if there is only one
    if @post.update_attributes(forum_params)
      flash[:notice] = "Your account was updated
      successfully."
    else
      flash[:alert] = "There was a problem saving your
      account."
    end
    redirect_to user_post_path(@post.user, @post)
  end

  private

  def forum_params
    params.require(:post).permit(:user_id, :title)
  end

end



class BlogpostsController < ApplicationController
  def blogpost
    @blogposts = Blogpost.all
  end

  def index
    @user = User.find(params[:user_id])
    @blogpost = @user.blogposts
  end

  def show
    @blogpost = Blogpost.find(params[:id])

  end

  def new
    @user = User.find(params[:user_id])
    @blogpost = Blogpost.new
  end

  def create
   @blogpost = Blogpost.new(blog_params)
   @blogpost.save

   # flash.notice = "Blogpost '#{@blogpost.title}' Created!"
   # redirect_to user_blogposts_path
  end

  def edit
    @user = User.find(params[:user_id])
    @blogpost = @user.blogposts.find(params[:id])
  end

  def update
  @user = User.find(params[:user_id])
  @blogpost = @user.blogposts.find(params[:id])
  @blogpost.update(blog_params)
  flash[:success] = "Blog '#{@blogpost.title}' Updated!"
  redirect_to user_blogposts_path(@blogpost.user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @blogpost = @user.blogposts.find(params[:id])
    @blogpost.destroy
    flash[:success] = "Blog '#{@blogpost.title}' Deleted!"
    redirect_to user_blogposts_path(@blogpost.user)
  end

  def blog_params
    params.require(:blogpost).permit(:title, :content, :summary)
  end

end

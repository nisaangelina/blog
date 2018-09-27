class BlogpostsController < ApplicationController
  def blogpost
    @blogposts = Blogpost.all
  end

  def index
    @blogpost = ::Blogpost.all
  end

  def show
    @blogpost = ::Blogpost.find(params[:id])
  end

  def new
    @blogpost = ::Blogpost.new
  end

  def create
    @blogpost = ::Blogpost.new(blog_params)
   if @blogpost.valid?
     @blogpost.save
     flash.notice = "Blogpost '#{@blogpost.title}' Created!"
     redirect_to blogposts_path
   else
    render 'new'
   end
  end

  def edit
    @blogpost = ::Blogpost.find(params[:id])
  end

  def update
  @blogpost = ::Blogpost.find(params[:id])
   if @blogpost.update(blog_params)
      flash[:success] = "'#{@blogpost.title}' Updated!"
       redirect_to blogposts_path
    else
      render 'edit'
    end
  end


  def destroy
    @blogpost = ::Blogpost.find(params[:id])
    @blogpost.destroy
    flash[:success] = "Blog '#{@blogpost.title}' Deleted!"
    redirect_to blogposts_path
  end

  def blog_params
    params.require(:blogpost).permit(:title, :content, :summary, :user_id, :image_url)
  end

end

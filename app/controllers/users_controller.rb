class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index]
    before_action :check_user, only: [:edit, :update]
    # before_action :admin_user,  only: [:edit, :update, :destroy]

  def index
    @users = ::User.all
  end

  def new
    @user = ::User.new(is_admin: false)
  end

  def create
    @user = ::User.new(user_params)
     if @user.save
      log_in @user
      flash[:success] = "Welcome to the Blog!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = ::User.find(params[:id])
  end

  def edit
    @user = ::User.find(params[:id])
  end

  def update
    @user = ::User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "'#{@user.name}' Updated!"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = ::User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
  end

  def check_user
    user = User.find(params[:id])
    if correct_user user || is_admin
      return true
    else
      return false
    end
  end

end

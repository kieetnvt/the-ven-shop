class UsersController < ApplicationController
  
  # before_filter :signed_in_user, only: [:edit, :update]
  # before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  
  def new
  	@user = User.new
  end

  def find
    @user = User.new
  end

  def show
  	@user = User.find(params[:id])
    
  end

  def create
  	@user = User.new(params[:user])
  	if(@user.save)
      flash[:success] = "Welcome to the Sample App"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def index
    @users = User.all
  end

  def listuser
    @users = User.all
  end

  def edit
    @user = User.find_by_remember_token(cookies[:remember_token])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def update
    @user = User.find_by_remember_token(cookies[:remember_token])
    if @user.update_attributes(params[:user])
      #Handle a successful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def admin_user
      redirect_to(home_path) unless current_user.admin?
    end
end


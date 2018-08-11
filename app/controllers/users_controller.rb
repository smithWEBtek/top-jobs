class UsersController < ApplicationController
  before_action :require_login, :except => [:new, :create]
  before_action :set_user, :except => [:new, :create]
  

  def new 
    redirect_to user_path(current_user) if logged_in?
    @user = User.new 
  end 

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      render :new
    end
  end 

  def show        
  end

  def edit         
  end

  def update 
    @user.update(user_params)
    redirect_to user_path(@user)
  end 


  private
  

  def user_params 
    params.require(:user).permit(:name, :password, :role)
  end
end

class UsersController < ApplicationController

  def new 
    redirect_to user_path(current_user) if logged_in?
    @user = User.new 
  end 

  def create 
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      render :new
    end
  end 

  def show 
    
    if logged_in?
        @user = User.find_by(id: params[:id])
    else
        redirect_to root_path 
    end 
   
  end

  def edit 
    @user = User.find_by(id: params[:id])
    
  end

  def update 
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end 

  private 
  def user_params 
    params.require(:user).permit(:name, :password, :role)
  end
end

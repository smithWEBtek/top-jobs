class UsersController < ApplicationController

  def new 
    redirect_to user_path(current_user) if logged_in?
    @user = User.new 
  end 

  def create 
    
    @user = User.new(user_params)
    #if user_params[:admin] == "1"
      #self.add_role(:admin) 
    
    #end

    session[:user_id] = @user.id 
    redirect_to user_path(@user)
  end 

  def show 
    if logged_in?
        @user = User.find_by(id: params[:id])
    else
        redirect_to root_path 
    end 
  end

  private 
  def user_params 
    params.require(:user).permit(:name, :password, :admin)
  end
end

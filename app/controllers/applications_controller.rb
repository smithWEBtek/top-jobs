class ApplicationsController < ApplicationController

  def new 
    @application = Application.new 
  end

  def create 
    @application = Application.create(application_params)
    redirect_to application_path(@application)
  end

  def show 
    @application = Application.find_by(id: params[:id])
    @user = current_user 
  end

  def edit 
    @application = Application.find_by(id: params[:id])
    @user = current_user 
  end 

  def update 
    @application = Application.find_by(id: params[:id])
    @application.update(application_params)
    redirect_to application_path(@application)
  end

  private 

  def application_params 
    params.require(:application).permit(:user_id, :job_id, :email, :qualifications)
  end
end

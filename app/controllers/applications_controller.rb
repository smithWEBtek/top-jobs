class ApplicationsController < ApplicationController

  def new 
    @application = Application.new (job_id: params[:job_id])
  end

  def index 
    if params[:job_id]
      @applications = Job.find(params[:job_id]).applications 
    else 
      @applications = Application.all 
    end 
  end

  def create 
    @application = Application.create(application_params)
    redirect_to application_path(@application)
  end

  def show 
    @user = current_user
    if params[:job_id]
      @job = Job.find_by(id: params[:job_id])
      @application = @job.applications.find_by(id: params[:id])
    else 
      @application = Application.find(params[:id])
    end
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

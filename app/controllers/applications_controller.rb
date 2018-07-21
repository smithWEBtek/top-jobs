class ApplicationsController < ApplicationController

  def new 
    
    @user = current_user
    if params[:job_id] 
      @job = Job.find_by_id(params[:job_id])
      @application = Application.new(job_id: params[:job_id])
    end
  end

  def index 
    @user = current_user
    if params[:job_id] 
      @job = Job.find_by(id: params[:job_id])      
      @applications = @job.applications 
    else 
      @applications = Application.all 
    end 
  end

  def create 
    @user = current_user
    @application = Application.create(application_params)
    if @application.save
      redirect_to application_path(@application)
    else 
      render :new 
    end
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

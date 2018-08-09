class JobApplicationsController < ApplicationController

  def new  
    @user = current_user   
    if !logged_in?
      flash[:alert] = "Please sign-in or sign-up to apply for a job"
      redirect_to '/'
    else   
    
      if params[:job_id] 
        @job = Job.find_by_id(params[:job_id])
        @job_application = JobApplication.new(job_id: params[:job_id])
      end
    end
  end

  def index 
    @user = current_user
    
    if params[:job_id] 
      @job = Job.find_by(id: params[:job_id])      
      @job_applications = @job.job_applications 
    else 
      @job_applications = JobApplication.all 
    end 
  end

  def create      
    @user = current_user
    @job = Job.find_by(id: params[:job_id]) 
    @job_application = JobApplication.new(job_application_params)
    if @job_application.valid?
      @job_application.save     
      
      redirect_to job_application_path(@job_application)
    else 
      render :new 
    end
  end

  def show 
    @user = current_user
    if params[:job_id]
      @job = Job.find_by(id: params[:job_id])
      @job_application = @job.applications.find_by(id: params[:id])
    else 
      @job_application = JobApplication.find(params[:id])
    end
  end

  def edit 
    @job_application = JobApplication.find_by(id: params[:id])
    @user = current_user 
  end 

  def update 
    @job_application = JobApplication.find_by(id: params[:id])
    @job_application.update(job_application_params)
    redirect_to job_application_path(@job_application)
  end

  def destroy 
    @job_application = JobApplication.find_by(id: params[:id])
    @job_application.destroy
    redirect_to '/'
  end

  private 

  def job_application_params 
    params.require(:job_application).permit(:user_id, :job_id, :email, :qualifications, :applicant_id)
  end
end

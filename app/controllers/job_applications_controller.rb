class JobApplicationsController < ApplicationController  
  before_action :require_login
  before_action :set_user
  before_action :find_job_application, :except => [:index, :new, :create, :show]

  def new  
    if params[:job_id] 
      @job = Job.find_by_id(params[:job_id])
      @job_application = JobApplication.new(job_id: params[:job_id])
    end
  end

  def index 
    if params[:job_id] 
      @job = Job.find_by(id: params[:job_id])      
      @job_applications = @job.job_applications 
      #binding.pry
    else 
      @job_applications = JobApplication.all 
    end 
  end

  def create      
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
    if params[:job_id]
      @job = Job.find_by(id: params[:job_id])
      @job_application = @job.job_applications.find_by(id: params[:id])
    else 
      @job_application = JobApplication.find(params[:id])
    end
  end

  def edit     
    @job = @job_application.job 
    @user = current_user 
  end 

  def update     
    @job_application.update(job_application_params)
    redirect_to job_application_path(@job_application)
  end

  def destroy     
    @job_application.destroy
    redirect_to '/'
  end

  private 

  def find_job_application
    @job_application = JobApplication.find_by(id: params[:id])
  end

  def job_application_params 
    params.require(:job_application).permit(:user_id, :job_id, :name, :email, :years_of_experience, :qualifications, :applicant_id)
  end
end

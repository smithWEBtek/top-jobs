class JobApplicationsController < ApplicationController  
  before_action :require_login
  before_action :set_user
  before_action :find_job_application, :except => [:index, :new, :create, :show]

  def new  
    if params[:job_id]
      @job = Job.find_by_id(params[:job_id])
      @job_application = JobApplication.new(job_id: params[:job_id])
      authorize @job_application
    end
  end

  def index 
    if params[:job_id] 
      @job = Job.find_by(id: params[:job_id])      
      @job_applications = @job.job_applications 
      #binding.pry
    else 
      @job_applications = JobApplication.all  #may get rid of this, s/only be for admin
    end 
  end

  def create 
    @job = Job.find_by(id: params[:job_id]) 
    @job_application = JobApplication.find_by_user_id_and_job_id(params[:job_application][:user_id], params[:job_application][:job_id])     
    if !@job_application.nil?
      redirect_to jobs_path, alert: "You already applied for this job"
    else      
      @job_application = JobApplication.new(job_application_params)
      if @job_application.save              
        redirect_to job_application_path(@job_application), alert: "Your application was successfully submitted"
      else 
        @job = @job_application.job
        render :new
      end
    end
  end

  def show 
    if params[:job_id]
      @job = Job.find_by(id: params[:job_id])      
      @job_application = @job.job_applications.find_by(id: params[:id])      
      authorize @job_application
    else
      find_job_application 
      authorize @job_application
    end
  end

  def edit     
    @job = @job_application.job 
    authorize @job_application
  end 

  def update   
    authorize @job_application  
    @job_application.update(job_application_params)
    redirect_to job_application_path(@job_application), alert: "Job Application successfully updated!"
  end

  def destroy 
    authorize @job_application
    @job_application.destroy
    redirect_to root_path, alert: "Job Application successfully deleted"
  end

  private 

  def find_job_application
    @job_application = JobApplication.find_by(id: params[:id])
  end

  def job_application_params 
    params.require(:job_application).permit(:user_id, :job_id, :name, :email, :years_of_experience, :qualifications, :applicant_id)
  end
end

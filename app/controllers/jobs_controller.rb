class JobsController < ApplicationController
  before_action :set_user, :except => [:index]
  before_action :require_login, :except => [:index]
  before_action :set_job, :except => [:index, :new, :create]

  def new 
    @job = Job.new 
    authorize @job
  end

  def index 
    if logged_in?
      set_user
    end
    @jobs = Job.most_recent_first  
  end 

  def create        
    @job = Job.create(job_params)       
    if @job.save      
      redirect_to job_path(@job), alert: "Job successfully created!"
    else         
      render :new     #needs a double click on create job to make this work
    end
  end

  def show 
    
  end

  def edit     
    authorize @job    
  end

  def update     
    authorize @job
    @job.update(job_params)
    redirect_to job_path(@job), alert: "Job successfully updated!"
  end 

  def destroy 
    authorize @job
    @job.destroy
    redirect_to user_path(@user), alert: "Job successfully deleted"
  end

  private  

  def set_job 
    @job = Job.find_by(id: params[:id])
  end  

  def job_params 
    params.require(:job).permit(:title, :location, :category, :company_name, :description, :salary, :company_id)
  end


end

class JobsController < ApplicationController

  def new 
    @user = current_user    
    @job = Job.new 
    
  end

  def index 
    @jobs = Job.all 
    @user = current_user 
  end 

  def create        
    @user = current_user
    @job = Job.new(job_params)
    authorize @job
    if @job.valid?
      @job.save      
      redirect_to job_path(@job), alert: "Job successfully created!"
    else 
      render :new, alert: "Please try entry again."
    end
  end

  def show     
    @job = Job.find_by(id: params[:id])
    @user = current_user 
  end

  def edit 
    @job = Job.find_by(id: params[:id])
    @user = current_user
    authorize @job  
  end

  def update 
    @job = Job.find_by(id: params[:id])
    authorize @job
    @job.update(job_params)
    redirect_to job_path(@job), alert: "Job successfully updated!"
  end 

  def destroy 
    @job = Job.find_by(id: params[:id])
    authorize @job
    @job.destroy
    redirect_to root_path, alert: "Job successfully deleted"
  end

  private

  def job_params 
    params.require(:job).permit(:title, :location, :category, :company_name, :description, :salary, :company_id)
  end



end

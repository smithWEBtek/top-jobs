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
    if @job.valid?
      @job.save      
      redirect_to job_path(@job)
    else 
      render :new
    end
  end

  def show 
    
    @job = Job.find_by(id: params[:id])
    @user = current_user 
  end

  def edit 
    @job = Job.find_by(id: params[:id])
    @user = current_user 
  end

  def update 
    @job = Job.find_by(id: params[:id])
    @job.update(job_params)
    redirect_to job_path(@job)
  end 

  def destroy 
    @job = Job.find_by(id: params[:id])
    @job.destroy
    redirect_to '/'
  end

  private

  def job_params 
    params.require(:job).permit(:title, :location, :category, :company_name, :description, :salary, :company_id)
  end



end

class JobsController < ApplicationController

  def new 
    @job = Job.new 
  end

  def index 
    @jobs = Job.all 
    @user = current_user 
  end 

  def create 
    @job = Job.create(job_params)
    redirect_to job_path(@job)
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

  private

  def job_params 
    params.require(:job).permit(:title, :location, :category, :company, :description, :salary)
  end



end

class JobApplicationPolicy < ApplicationPolicy 

  def created_by_applicant?
    user.applicant? && record.applicant_id == user.id 
  end 

  def company_owns_job?
    user.company? && record.job.company_id == user.id 
  end
   
  def new?
    user.applicant?
  end    
   
  def create?
    user.applicant?
  end 

  def index?
    user.company?
  end


  def show?
    created_by_applicant? || company_owns_job?
  end
   
  def update?
    created_by_applicant? 
  end 
   
  def destroy?
    created_by_applicant?
  end  
end 
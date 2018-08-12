class JobPolicy < ApplicationPolicy 

   def created_by_company?
     user.company? && record.company_id == user.id 
   end 

   def new?
    user.company?
   end

   def create?
    user.company?
   end 

   def update?
    created_by_company? 
   end 

   def destroy?
    created_by_company?
   end
end


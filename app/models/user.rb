class User < ApplicationRecord
    validates_presence_of :name, :password
    validates :name, uniqueness: true
    has_secure_password

    enum role: [:applicant, :company] 

    has_many :jobs, :foreign_key => 'company_id', source: :company

    has_many :job_applications, :foreign_key => 'user_id'
    has_many :applied_jobs, through: :job_applications, :class_name => 'Job', :foreign_key => 'applicant_id', source: :applicant
    
    

    def set_default_role 
        self.role ||= :applicant
    end
end

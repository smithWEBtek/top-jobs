class User < ApplicationRecord

    enum role: [:applicant, :company] 

    has_many :jobs, :foreign_key => 'company_id', source: :company

    has_many :applications, :foreign_key => 'user_id'
    #has_many :jobs, through: :applications, :foreign_key => 'applicant_id', source: :applicant
    has_secure_password
    

    def set_default_role 
        self.role ||= :user 
    end
end

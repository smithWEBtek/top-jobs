class User < ApplicationRecord

    enum role: [:applicant, :company] 

    has_many :jobs, :foreign_key => 'company_id'

    has_many :applications, :foreign_key => 'user_id'
    has_many :jobs, through: :applications, :foreign_key => 'user_id'
    has_secure_password
    

    def set_default_role 
        self.role ||= :user 
    end
end

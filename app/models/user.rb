class User < ApplicationRecord
    has_many :applications
    has_many :jobs, through: :applications
    has_secure_password
    enum role: [:user, :company, :admin] 

    def set_default_role 
        self.role ||= :user 
    end
end

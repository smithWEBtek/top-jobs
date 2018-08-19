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

    def self.find_or_create_by_omniauth(auth_hash)
      self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
        user.provider = auth_hash.provider
        user.uid = auth_hash.uid
        user.name = auth_hash.info.name
        user.password = SecureRandom.hex
        user.role = "applicant"
            
        user.save!
      end
    end    

end

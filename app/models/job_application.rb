class JobApplication < ApplicationRecord
    validates_presence_of :email, :qualifications
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    

    belongs_to :job 
    belongs_to :applicant, :class_name => 'User', :foreign_key => 'applicant_id' 
end

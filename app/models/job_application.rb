class JobApplication < ApplicationRecord
    belongs_to :job 
    belongs_to :applicant, :class_name => 'User', :foreign_key => 'applicant_id' 

    validates_presence_of :name, :email, :years_of_experience, :qualifications
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    
    scope :most_recent_applications, -> { reorder(created_at: :desc)}
    
    
end

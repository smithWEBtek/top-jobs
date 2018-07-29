class Job < ApplicationRecord
    belongs_to :company, :class_name => 'User', :foreign_key => 'company_id'
    has_many :applications 
    has_many :applicants, :through => :applications, :class_name => 'User' 

end

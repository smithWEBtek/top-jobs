class Job < ApplicationRecord
    validates_presence_of :title, :location, :category, :company_name, :salary, :description
    
    belongs_to :company, :class_name => 'User', :foreign_key => 'company_id'
    has_many :applications 
    has_many :applicants, :through => :applications, :class_name => 'User' 

end

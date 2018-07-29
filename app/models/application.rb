class Application < ApplicationRecord
    belongs_to :job 
    belongs_to :applicant, :class_name => 'User', :foreign_key => 'applicant_id' 
end

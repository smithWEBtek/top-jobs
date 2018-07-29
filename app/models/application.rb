class Application < ApplicationRecord
    belongs_to :job 
    belongs_to :user, :class_name => 'User', :foreign_key => 'user_id' 
end

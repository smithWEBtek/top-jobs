class Application < ApplicationRecord
    belongs_to :jobs 
    belongs_to :user 
end

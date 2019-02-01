class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :password, :role
	
	has_many :jobs
	has_many :job_applications
	has_many :applied_jobs, through: :job_applications

end

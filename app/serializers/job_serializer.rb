class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :location, :company_name, :company_id, :salary, :created_at, :category

  belongs_to :company
  has_many :job_applications 
  has_many :applicants, :through => :job_applications
end

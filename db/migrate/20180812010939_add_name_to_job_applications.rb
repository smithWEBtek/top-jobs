class AddNameToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :name, :string
  end
end

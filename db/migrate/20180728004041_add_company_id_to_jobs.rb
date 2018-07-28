class AddCompanyIdToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :company_id, :integer
  end
end

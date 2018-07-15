class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :category
      t.string :company
      t.string :description
      t.integer :salary

      t.timestamps
    end
  end
end

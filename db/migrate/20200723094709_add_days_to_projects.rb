class AddDaysToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :days, :integer
  end
end

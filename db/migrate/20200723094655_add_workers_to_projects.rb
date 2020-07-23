class AddWorkersToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :workers, :integer
  end
end

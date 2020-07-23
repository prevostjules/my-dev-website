class AddSummaryToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :summary, :string
  end
end

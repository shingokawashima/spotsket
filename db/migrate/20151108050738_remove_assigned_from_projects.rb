class RemoveAssignedFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :assigned, :boolean
  end
end

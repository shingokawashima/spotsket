class AddAssignedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :assigned, :boolean
  end
end

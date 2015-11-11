class AddAssignedToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :assigned, index: true, foreign_key: true
  end
end

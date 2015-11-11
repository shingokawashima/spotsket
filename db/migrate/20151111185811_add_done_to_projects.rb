class AddDoneToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :done, :string
  end
end

class AddSkillsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :skill1, :booleab
    add_column :projects, :skill2, :booleab
    add_column :projects, :skill3, :booleab
    add_column :projects, :skill4, :booleab
  end
end

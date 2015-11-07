class AddIntroductionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :introduction, :text
  end
end

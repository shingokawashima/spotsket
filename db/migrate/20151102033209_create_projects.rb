class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :company, index: true
      t.string :name
      t.string :title
      t.text :description
      t.string :required_skills
      t.string :required_background
      t.integer :budget
      t.integer :hours
      t.date :period
      t.string :type
      t.string :emergent

      t.timestamps null: false
    end
  end
end

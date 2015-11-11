class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :type
      t.references :student
      t.references :company
      t.references :reply_to
      t.string :title
      t.text :content

      t.timestamps null: false
      t.index [:student_id, :company_id], unique: true
      
    end
  end
end
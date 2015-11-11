class AddReadFlgToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :read_flg, :boolean, null: nil, default: false
  end
end

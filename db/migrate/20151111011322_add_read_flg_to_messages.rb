class AddReadFlgToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :read_flg, :string
  end
end

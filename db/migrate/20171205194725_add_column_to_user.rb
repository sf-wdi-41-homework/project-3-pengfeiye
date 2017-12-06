class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirm_password, :string
  end
end

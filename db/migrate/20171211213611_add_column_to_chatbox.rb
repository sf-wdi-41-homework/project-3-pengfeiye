class AddColumnToChatbox < ActiveRecord::Migration[5.1]
  def change
    add_column :chatboxes, :chatType, :string
  end
end

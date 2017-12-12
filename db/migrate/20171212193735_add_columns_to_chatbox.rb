class AddColumnsToChatbox < ActiveRecord::Migration[5.1]
  def change
    add_column :chatboxes, :owner_id, :integer
    add_column :chatboxes, :pending, :integer, array:true, default: []
  end
end

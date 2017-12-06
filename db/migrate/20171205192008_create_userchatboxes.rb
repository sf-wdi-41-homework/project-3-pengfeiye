class CreateUserchatboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :userchatboxes do |t|
      t.references :chatbox, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

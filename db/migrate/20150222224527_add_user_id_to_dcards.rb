class AddUserIdToDcards < ActiveRecord::Migration
  def change
    add_column :dcards, :user_id, :integer
    add_index :dcards, :user_id
  end
end

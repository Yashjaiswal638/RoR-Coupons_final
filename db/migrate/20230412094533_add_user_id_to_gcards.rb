class AddUserIdToGcards < ActiveRecord::Migration[7.0]
  def change
    add_column :gcards, :user_id, :integer
  end
end

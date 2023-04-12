class RemoveOwnerFromgcard < ActiveRecord::Migration[7.0]
  def change
    remove_column :gcards, :owner
  end
end

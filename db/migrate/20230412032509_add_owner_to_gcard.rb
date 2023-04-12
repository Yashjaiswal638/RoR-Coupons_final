class AddOwnerToGcard < ActiveRecord::Migration[7.0]
  def change
    add_column :gcards, :owner, :string
  end
end
